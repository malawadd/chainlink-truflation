// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import "../src/interfaces/IStore.sol";
import "../src/Trade.sol";
import "../src/Pool.sol";
import "../src/Store.sol";
import "../src/CLP.sol";
import "../src/Chainlink.sol";

contract DeployGoerli is Script {
    uint256 public constant CURRENCY_UNIT = 10 ** 6;

    /* ========== FORK CONFIG ========== */
    uint256 GOERLIitrum;

    string GOERLI_RPC_URL = vm.envString("GOERLI_RPC_URL");

    /* ========== DEPLOYMENT ADDRESSES ========== */
    // Uniswap Router and Quoter for Polygon, GOERLIitrum and Optimism
    // see also https://docs.uniswap.org/contracts/v3/reference/deployments
    address swapRouter = address(0xE592427A0AEce92De3Edee1F18E0157C05861564);
    address quoter = address(0xb27308f9F90D607463bb33eA1BeBb41C27CE5AB6);

    // Deployment addresses for USDC
    address GOERLI_USDC = address(0x8325F6AdBe43004A2670bAa519276584fEAbE85a);

    // Deployment addresses for WETH
    address GOERLI_WETH = address(0xee189380Cfb9f390323A581e19a660820A58F3b8);

    // Chainlink Sequencer on GOERLIitrum and Optimism
    address GOERLI_SEQ = address(0xFdB631F5EE196F0ed6FAa767959853A9F217697D);

    /* ========== PRICE FEEDS ========== */
    address GOERLI_ETHUSD = address(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    address GOERLI_XAUUSD = address(0x7b219F57a8e9C7303204Af681e9fA69d17ef626f);

    /* ========== CONTRACTS ========== */
    Trade public trade;
    Pool public pool;
    Store public store;
    CLP public clp;

    Chainlink public chainlink;

    /* ========== METHODS ========== */
    function run() public {
        // create fork
        GOERLIitrum = vm.createFork(GOERLI_RPC_URL);

        // private key for deployment
        uint256 pk = vm.envUint("PRIVATE_KEY");
        console.log("Deploying contracts with address", vm.addr(pk));

        _deploy(
            GOERLIitrum,
            pk,
            GOERLI_SEQ,
            GOERLI_USDC,
            GOERLI_ETHUSD,
            GOERLI_XAUUSD,
            swapRouter,
            quoter,
            GOERLI_WETH,
            vm.addr(pk),
            vm.addr(pk)
        );
    }

    function _deploy(
        uint256 fork,
        uint256 pk,
        address sequencer,
        address usdc,
        address ethFeed,
        address xauFeed,
        address _swapRouter,
        address _quoter,
        address _weth,
        address _treasury,
        address _gov
    ) internal {
        // select fork
        vm.selectFork(fork);

        // start broadcasting
        vm.startBroadcast(pk);

        // deploy contracts
        chainlink = new Chainlink{salt: bytes32("CHAINLINK1")}();
        store = new Store{salt: bytes32("STORE1")}(_gov);
        trade = new Trade{salt: bytes32("TRADE1")}(_gov);
        pool = new Pool{salt: bytes32("POOL1")}(_gov);
        clp = new CLP{salt: bytes32("CLP1")}(address(store));

        // Link contracts
        store.link(address(trade), address(pool), usdc, address(clp));
        store.linkUniswap(_swapRouter, _quoter, _weth);
        trade.link(address(chainlink), address(pool), address(store));
        pool.link(address(trade), address(store), _treasury);

        // Setup markets
        store.setMarket(
            "ETH-USD",
            IStore.Market({
                symbol: "ETH-USD",
                feed: ethFeed,
                maxLeverage: 50,
                maxOI: 5000000 * CURRENCY_UNIT,
                fee: 10,
                fundingFactor: 5000,
                minSize: 20 * CURRENCY_UNIT,
                minSettlementTime: 1 minutes
            })
        );
        store.setMarket(
            "SXUA-USD",
            IStore.Market({
                symbol: "SXUA-USD",
                feed: xauFeed,
                maxLeverage: 50,
                maxOI: 5000000 * CURRENCY_UNIT,
                fee: 10,
                fundingFactor: 5000,
                minSize: 20 * CURRENCY_UNIT,
                minSettlementTime: 1 minutes
            })
        );

        vm.stopBroadcast();
    }
}

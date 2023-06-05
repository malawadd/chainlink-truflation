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
    address GOERLI_USDC = address(0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8);

    // Deployment addresses for WETH
    address GOERLI_WETH = address(0x82aF49447D8a07e3bd95BD0d56f35241523fBab1);

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
        address btcFeed,
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
        chainlink = new Chainlink{salt: bytes32("CHAINLINK4")}(sequencer);
        store = new Store{salt: bytes32("STORE4")}(_gov);
        trade = new Trade{salt: bytes32("TRADE4")}(_gov);
        pool = new Pool{salt: bytes32("POOL4")}(_gov);
        clp = new CLP{salt: bytes32("CLP4")}(address(store));

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
            "BTC-USD",
            IStore.Market({
                symbol: "BTC-USD",
                feed: btcFeed,
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

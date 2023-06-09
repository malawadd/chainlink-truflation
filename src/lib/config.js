export const DEFAULT_LOCALE = 'en-GB';
export const DEFAULT_MARKET = 'SXUA-USD';
export const DEFAULT_LEVERAGE = 50;
export const ADDRESS_ZERO = '0x0000000000000000000000000000000000000000';
export const BPS_DIVIDER = 10000;
export const DEFAULT_MARKETS_SORT_KEY = ['market', false];
export const DEFAULT_ORDERS_SORT_KEY = ['orderId', true];
export const DEFAULT_POSITIONS_SORT_KEY = ['timestamp', true];
export const DEFAULT_HISTORY_SORT_KEY = ['timestamp', true];
export const DEFAULT_HISTORY_COUNT = 50;
export const DEFAULT_CHAIN_ID = 5;
export const CHAINDATA = {
	31337: {
		label: 'localhost',
		explorer: 'http://localhost:8545',
		rpc: 'http://127.0.0.1:8545/',
		currencyName: 'USDC',
		currencyAddress: '0xa85233C63b9Ee964Add6F2cffe00Fd84eb32338f', // USDC address
		currencyDecimals: 6, // USDC
		contracts: {
			Trade: '0x09635F643e140090A9A8Dcd712eD6285858ceBef',
			Pool: '0xc5a5C42992dECbae36851359345FE25997F5C42d',
			Store: '0x7a2088a1bFc9d81c55368AE168C2C02570cB814F',
		},
		alchemy: {
			key: 'testkey',
			network: 'testnetwork',
			wsNetwork: 'ws://localhost:8545/'
		},
		chainlinkSchema: "ethereum-mainnet-goeril-1",
		subgraphUrl: "http://localhost:8000/subgraphs/name/FlationDEX-subgraph",
		chainName: "Local Testnet",
		chainId: '0x7A69', //chainId number in hexadecimal prefixed by 0x 
		nativeAssetName: "GO",
		nativeAssetSymbol: "GO",
		nativeAssetDecimals: 18,
	},
	5: {
		label: 'Goerli',
		explorer: 'https://goerli.etherscan.io/',
		rpc: 'https://rpc.ankr.com/eth_goerli', // for walletconnect
		currencyName: 'USDC',
		currencyAddress: '0x8325F6AdBe43004A2670bAa519276584fEAbE85a', // USDC address
		currencyDecimals: 6, // USDC
		contracts: {
			Trade: '0x2F21DBd134D023cA4a635911F742ADf6927f4406',
			Pool: '0x7802C218Fd4363674CcD519936781733777a1295',
			Store: '0x3252Ad9e90B36a5680cC407b967a3d84E5eEc21D',
		},
		alchemy: {
			key: 'gDY8gANK8VJAg508BzJbdCpmZ4N43IZP',
			network: 'goerli',
			wsNetwork: 'goer-testnet'
		},
		chainlinkSchema: "ethereum-mainnet-Goerli-1",
		subgraphUrl: "http://localhost:8000/Goerli-subgraph",
		chainName: 'Goerli',
		chainId: '0x5', //chainId number in hexadecimal prefixed by 0x
		nativeAssetName: 'ETH',
		nativeAssetSymbol: 'ETH',
		nativeAssetDecimals: 18,
	},
}
export const CHAINLINK_URL = "https://atlas-postgraphile.public.main.prod.cldev.sh/graphql"
export const CHAINLINK_CONTRACT_ADDRESSES = {
	'BTC-USD': "0x7b219F57a8e9C7303204Af681e9fA69d17ef626f",
	'SXUA-USD': "0x7b219F57a8e9C7303204Af681e9fA69d17ef626f",
	'ETH-USD': "0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e"
}
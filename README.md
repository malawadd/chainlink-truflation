
  
<h1 align="center">
  <br>
  <a href=""><img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgZ8nZl1tpxl_8iJZI9vKtQwxslt-lVcyg7PJKXIgiKgw7yDtEIIqW7zrBxH5JAxKEu9iqs7toD4hs0AaIINvZ7-6u0HZRSIAwCanm4X5N1-6iD_Jc7fEFKugCl8psbZB0bF6H7kyYby1JFurvspy8fT8wD0g-xyhRMgQQHw3Ml2A7V2_9cOCZS6awm/s945/paper2.png" width="300"></a>
  <br>
  FlationDEX
  <br>
</h1>

<h4 align="center">commedity markets dex</h4>

<p align="center">
  <a href="#Introduction">Introduction</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#how-it-works">How It Works</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits ">Credits </a> •
  <a href="#contracts-addresses ">Contracts Addresses </a> •
</p>

![screenshot](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhy7-P7cZvEj5cHrHJayONWQ99L13wAgTR3tk_XIaJORe5Z_xbY2sLrZo2Orv32acGrVcG_bO_CAod8Ewn9BIIZ0bXSzmheq4lqvt7Cx-6whVlRM-UtDfRiVwTun3IAYQoiR4ryslGLoUqAg9zzvBqtvddlOOKLIoiU6lur7quDy2rGpoy2fgbkTi-s/s1000/Untitled-1-Recovered.png)

## Introduction 

FlationDEX lets you trade commedity markets like XAU/USD and XAG/USD with leverage. It is decentralized, open source, and accessible to everyone.



## Key Features
FlationDEX has all the features you need for fast and secure on-chain trading, including:

- **Cross Margin:** Margin is shared between positions, minimizing liquidations.

- **Risk Management:** Set limit, stop, take-profit, and stop-loss.

- **Dynamic Funding:** Longs pay shorts (and vice versa) based on open interest.

- **Trustless:** Interact directly with on-chain smart contracts (no intermediaries).


## How It Works

You buy to profit from rising prices. You sell to profit from falling prices.

Your profits are paid from the pool. Your losses are paid to the pool.

- 50% of trading fees go to the pool.
- 40% go to the treasury which buys back the protocol token, among other things.
- 10% go to keepers which trigger order executions.

Your account is **liquidated** when its margin level reaches 20%.

All prices are provided in real-time on-chain by **Chainlink** and **trufflation** .


## How To Use

To clone and run this project , you'll need [Git](https://git-scm.com) and [Node.js](https://nodejs.org/en/download/) (which comes with [npm](http://npmjs.com)) installed on your computer. From your command line:

```bash
# Clone this repository
$ git https://github.com/malawadd/chainlink-truflation.git

# Go into the repository
$ cd chainlink-truflation

# Install dependencies
$ yarn install

# Run the app
$ yarn dev
```

> **Note**
> If you're using Linux Bash for Windows, [see this guide](https://docs.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl) or use `node` from the command prompt.

//
> **Note 2**
make sure you mint USDC token avalible in the contract section below . 


## Credits

FlationDEX uses the following open source packages:

- [svelte Kit](https://kit.svelte.dev/) SvelteKit is built on Svelte, a UI framework that uses a compiler to let you write breathtakingly concise components that do minimal work in the browser . 
- [tippy.js](https://atomiks.github.io/tippyjs/) TTippy.js is the complete tooltip, popover, dropdown, and menu solution for the web, powered by Popper.
- [ethers](https://docs.ethers.org/v5/)  dThe ethers.js library aims to be a complete and compact library for interacting with the Ethereum Blockchain and its ecosystem
- [rollupjs](https://rollupjs.org/) The JavaScript module bundler Compile small pieces of code into something larger and more complex
- [chartjs](https://www.chartjs.org/) Simple yet flexible JavaScript charting library for the modern web
- [Foundry ](https://book.getfoundry.sh/) Foundry is a smart contract development toolchain.


##  Contracts Addresses 
USDC TOKEN: [0x8325F6AdBe43004A2670bAa519276584fEAbE85a](https://goerli.etherscan.io/address/0x8325f6adbe43004a2670baa519276584feabe85a)

Trade: [0x2F21DBd134D023cA4a635911F742ADf6927f4406](https://goerli.etherscan.io/address/0x2F21DBd134D023cA4a635911F742ADf6927f4406)

Pool : [0x7802C218Fd4363674CcD519936781733777a1295](https://goerli.etherscan.io/address/0x7802C218Fd4363674CcD519936781733777a1295)

Store : [0x3252Ad9e90B36a5680cC407b967a3d84E5eEc21D](https://goerli.etherscan.io/address/0x3252Ad9e90B36a5680cC407b967a3d84E5eEc21D)


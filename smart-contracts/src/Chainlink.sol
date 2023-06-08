// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Chainlink {
    // -- Constants -- //

    uint256 public constant UNIT = 10 ** 18;
    uint256 public constant GRACE_PERIOD_TIME = 3600;

    // -- Variables -- //

    AggregatorV3Interface internal sequencerUptimeFeed;

    // -- Errors -- //

    error SequencerDown();
    error GracePeriodNotOver();

    /**
     * For a list of available sequencer proxy addresses, see:
     * https://docs.chain.link/docs/l2-sequencer-flag/#available-networks
     */

    // -- Constructor -- //

    constructor() {}

    function getPrice(address feed) public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(feed);
        (
            ,
            /*uint80 roundID*/
            int256 price,
            ,
            ,

        ) = /*uint startedAt*/
            /*uint timeStamp*/
            /*uint80 answeredInRound*/
            priceFeed.latestRoundData();

        uint8 decimals = priceFeed.decimals();

        // Return 18 decimals standard
        return (uint256(price) * UNIT) / 10 ** decimals;
    }
}

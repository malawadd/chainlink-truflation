// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

contract TfiSample is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;
    bytes public result;
    mapping(bytes32 => bytes) public results;
    address public oracleId;
    string public jobId;
    uint256 public fee;

    constructor() ConfirmedOwner(msg.sender) {
	setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        oracleId = 0x6888BdA6a975eCbACc3ba69CA2c80d7d7da5A344;
        jobId = "d220e5e687884462909a03021385b7ae";
        fee = 500000000000000000;
    }

      function getpricegold( ) public returns (bytes32 requestId) {
          Chainlink.Request memory req = buildChainlinkRequest(
            bytes32(bytes(jobId)),
            address(this), this.fulfillBytes.selector);
        req.add("service", "truflation/series");
        req.add("data", "{\"ids\":\"501\",\"types\":\"114\"}");
        req.add("keypath", "");
        req.add("abi", "uint256");
        req.add("multiplier", "1000000000000000000");
        return sendChainlinkRequestTo(oracleId, req, fee);
    }

    function fulfillBytes(bytes32 _requestId, bytes memory bytesData)
        public recordChainlinkFulfillment(_requestId) {
        result = bytesData;
        results[_requestId] = bytesData;
    }


    function changeOracle(address _oracle) public onlyOwner {
        oracleId = _oracle;
    }

    function changeJobId(string memory _jobId) public onlyOwner {
        jobId = _jobId;
    }

    function changeFee(uint256 _fee) public onlyOwner {
        fee = _fee;
    }

    function changeToken(address _address) public onlyOwner {
        setChainlinkToken(_address);
    }

    function getToken() public view returns (address) {
        return chainlinkTokenAddress();
    }

    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
            require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
  }
    /** Use a function like this if you want to process the item
        as int256 */

    function getInt256(bytes32 _requestId) public view returns (int256) {
       return toInt256(results[_requestId]);
    }

    function toInt256(bytes memory _bytes) internal pure
      returns (int256 value) {
          assembly {
            value := mload(add(_bytes, 0x20))
      }
   }

}

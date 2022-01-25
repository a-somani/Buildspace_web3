// SPDX-License-Identifier: UNLICENSED
pragma solidity ^ 0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) public userWaves;

    constructor(){
        console.log("Yo yo, im a smart contract");
    }

    function wave() public{
        totalWaves += 1;
        userWaves[msg.sender] += 1;
        console.log("%s has waved", msg.sender);
        console.log("Their total # of waves is: ", userWaves[msg.sender]);
    }

    function getTotalWaves() public view returns (uint256){
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

}
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^ 0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) public userWaveCount;
    mapping(address => uint256) public lastWavedAt;
    event NewWave(address indexed from, uint256 timestamp, string message); 
    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }
    Wave[] waves; //array of Wave structs

    constructor(){
        console.log("My third smart contract!");
    }

    modifier minuteDelay(){
        require(lastWavedAt[msg.sender] + 1 minutes < block.timestamp, "wait 1 minute");
        _;
    }

    function wave(string calldata _message) public minuteDelay {
        lastWavedAt[msg.sender] = block.timestamp;
        totalWaves += 1;
        userWaveCount[msg.sender] += 1;
        console.log("%s has waved", msg.sender);
        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getTotalWaves() public view returns (uint256){
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllWaves() public view returns (Wave[] memory){
       return waves;
    }

    function getUserWaves(address _address) public view returns (uint256 userWaves){
        userWaves = userWaveCount[_address];
        console.log("%s has %d total waves!", _address, userWaves);
    }
}
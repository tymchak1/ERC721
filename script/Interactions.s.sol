// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MyToken} from "../src/MyToken.sol";

contract MintMyToken is Script {
    string public constant PUG = "ipfs://bafybeibc5sgo2plmjkq2tzmhrn54bk3crhnc23zd2msg4ea7a4pxrkgfna/4859";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MyToken", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MyToken(contractAddress).safeMint(PUG);
        vm.stopBroadcast();
    }
}

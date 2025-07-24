// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";
import {DeployMyToken} from "../script/DeployMyToken.s.sol";

contract MyTokenTest is Test {
    DeployMyToken public deployer;
    MyToken public myToken;

    function setUp() public returns (MyToken) {
        deployer = new DeployMyToken();
        deployer.run();
    }

    /*//////////////////////////////////////////////////////////////
                              DEPLOYMENT TESTS
    //////////////////////////////////////////////////////////////*/

    /*//////////////////////////////////////////////////////////////
                              MINTING TESTS  
    //////////////////////////////////////////////////////////////*/

    /*//////////////////////////////////////////////////////////////
                              TOKEN URI TESTS  
    //////////////////////////////////////////////////////////////*/
}

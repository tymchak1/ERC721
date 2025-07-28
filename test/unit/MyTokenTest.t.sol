// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../../src/MyToken.sol";
import {DeployMyToken} from "../../script/DeployMyToken.s.sol";

contract MyTokenTest is Test {
    DeployMyToken public deployer;
    MyToken public myToken;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeibc5sgo2plmjkq2tzmhrn54bk3crhnc23zd2msg4ea7a4pxrkgfna/4859";

    function setUp() public returns (MyToken) {
        deployer = new DeployMyToken();
        myToken = deployer.run();
    }

    /*//////////////////////////////////////////////////////////////
                              DEPLOYMENT TESTS
    //////////////////////////////////////////////////////////////*/

    function test_NameIsCorrect() public view {
        string memory expectedName = "MyToken";
        string memory actualName = myToken.name();
        // two strings comparing
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function test_TokenIdIsZero() public view {
        assert(myToken.getNextTokenId() == 0);
    }

    /*//////////////////////////////////////////////////////////////
                              MINTING TESTS  
    //////////////////////////////////////////////////////////////*/

    function test_CanMintAndHaveABalance() public {
        vm.prank(USER);
        myToken.safeMint(PUG);
        assert(myToken.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(myToken.getTokenUri(0)))
        );
    }

    /*//////////////////////////////////////////////////////////////
                              TOKEN URI TESTS  
    //////////////////////////////////////////////////////////////*/
}

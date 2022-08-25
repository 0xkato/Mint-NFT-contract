// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../MyEpicNFT.sol";

contract MyEpicNFTTest is Test {
    MyEpicNFT public myEpicNFT;
    address bob  = address(0x1);
    address alice  = address(0x2);
    uint256 tokenid = 0;

    function setUp() public {
        myEpicNFT = new MyEpicNFT();
    }

    function testmakeAnEpicNFT() public {
        vm.startPrank(bob);
        myEpicNFT.makeAnEpicNFT();
        vm.stopPrank();
        tokenid = myEpicNFT.getTotalNFTsMintedSoFar();
        assertEq(tokenid, 1);
        console.log("Bob has minted token ID:", tokenid);

        vm.startPrank(alice);
        myEpicNFT.makeAnEpicNFT();
        vm.stopPrank();
        tokenid = myEpicNFT.getTotalNFTsMintedSoFar();
        assertEq(tokenid, 2);
        console.log("alice has minted token ID:", tokenid);
    }   
}

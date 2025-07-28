// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721 {
    uint256 private _nextTokenId;
    mapping(uint256 => string) public s_tokenIdToUri;

    constructor() ERC721("MyToken", "MTK") {
        _nextTokenId = 0;
    }

    function safeMint(string memory tokenUri) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        s_tokenIdToUri[tokenId] = tokenUri;
    }

    function getTokenUri(
        uint256 tokenId
    ) external view returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }

    function getNextTokenId() public view returns (uint256) {
        return _nextTokenId;
    }
}

// SPDX-License-Identifier: NONE

pragma solidity >=0.8.10 <=0.8.10;

import "./OpenzeppelinERC721.sol";

contract nft is  ERC721URIStorage , ERC721Enumerable {

    address public owner;

    uint256 public nftid = 1;
//  example string ipfs_base = "ipfs://QmSgK4i9oEE8vtS7JvCGXsepeDYx6s7q4qse254iUU8Ds8/";
    string ipfs_base = "";

    function mint() public {
        //require( _msgSender() == owner );
        _safeMint( _msgSender() , nftid);
        nftid++;
    }

    function _baseURI() internal view override returns (string memory) {
        return ipfs_base;
    }

    function setTokenURI( uint targetnftid ,string memory _uri ) public {
        require( _msgSender() == owner );
        //ipfs://Qm....... or https://arweave.net/......  etc.
        _setTokenURI( targetnftid , _uri );
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }


    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function burn(uint256 _id) public {
        require( _msgSender() == ownerOf(_id));
        _burn(_id);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }


    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }



    constructor() ERC721("nft" , "NFT" ) {
        owner = _msgSender();
    } 


}

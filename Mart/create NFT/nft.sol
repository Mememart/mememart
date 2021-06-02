@pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/utils/Counters.sol"

	contract UniqueAsset is ERC721{
		using Counters for Counters.Counter;
		Counters.Counter private _tokenIds;
		mapping(string => uint8) hashes;
		constructor() public ERC721("UniqueAsset", "UNA") {}
		}

	contract newNFT is NFTokenMetadata, Ownable {

	  constructor() {
		nftName = "Synth NFT";
		nftSymbol = "SYN";
		}

	  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
		super._mint(_to, _tokenId);
		super._setTokenUri(_tokenId, _uri);
		}
	
	  function awardItem(address recipient, string memory hash, string memory metadata) public returns (uint256){
		require(hashes[hash] != 1);
		hashes[hash] = 1;
		_tokenIds.increment();
		uint256 newItemId = _tokenIds.current();
		_mint(recipient, newItemId);
		_setTokenURI(newItemId, metadata);
		
		return newItemId;
		}

	}
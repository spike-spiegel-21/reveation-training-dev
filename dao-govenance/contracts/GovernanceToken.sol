// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//to snapshot voting power at a cretain moment we use ERC20Votes
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract GovernanceToken is ERC20Votes {
	uint256 public s_maxSupply = 1000000000000000000000000;

	constructor()
		ERC20("GovernanceToken", "GT")
		ERC20Permit("GovernanceToken")
	{
		//minted all tokens to sender, but we can distribute it.
		//here mint will write a check point for the snapshot.
		_mint(msg.sender, s_maxSupply);
	}

	// The functions below are overrides required by Solidity.

	function _afterTokenTransfer(
		address from,
		address to,
		uint256 amount
	) internal override(ERC20Votes) {
		//ultimately we are calling the parent class.
		super._afterTokenTransfer(from, to, amount);
	}

	function _mint(address to, uint256 amount) internal override(ERC20Votes) {
		super._mint(to, amount);
	}

	function _burn(address account, uint256 amount)
		internal
		override(ERC20Votes)
	{
		super._burn(account, amount);
	}
}

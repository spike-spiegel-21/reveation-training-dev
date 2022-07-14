// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/governance/TimelockController.sol";

//sets the role for proposers and executers
contract TimeLock is TimelockController {
	constructor(
		uint256 minDelay,
		address[] memory proposers,
		address[] memory executors
	) TimelockController(minDelay, proposers, executors) {}
}

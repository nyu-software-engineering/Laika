pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Laikoin.sol";

contract TestLaikoin {
	function testTotalSupply() public {
		Laikoin lai = new Laikoin();
		uint expected = 7500000;
		uint result = lai.totalSupply();
		Assert.equal(result, expected, "Initial total supply should be 7500000");
	}

	function testTransfer() public {
		Laikoin user1 = new Laikoin();
		Laikoin user2 = new Laikoin();
		_mint(user1, 1000);
		bool success = user1.transfer(user2, 500);
		Assert.equal(success, true, "transfer should succeed");
		Assert.equal(user1.balanceOf(this), 500, "User1 should have 500 tokens");
		Assert.equal(user2.balanceOf(this), 1500, "User2 should have 1500 tokens");
	}
}
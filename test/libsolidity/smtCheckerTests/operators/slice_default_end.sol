pragma experimental SMTChecker;

contract C {
	function f(bytes calldata b) external pure {
		require(b.length == 30);
		require(b[10] == 0xff);
		require(b[b.length - 1] == 0xaa);
		assert(bytes(b[10:]).length == 20);
		assert(bytes(b[10:])[0] == 0xff);
		assert(bytes(b[10:])[5] == 0xff);
		assert(bytes(b[10:])[19] == 0xaa);
	}
}
// ----
// Warning 4661: (221-253): BMC: Assertion violation happens here.
// Warning 4661: (257-289): BMC: Assertion violation happens here.
// Warning 4661: (293-326): BMC: Assertion violation happens here.

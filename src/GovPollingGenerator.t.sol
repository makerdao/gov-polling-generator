pragma solidity ^0.5.2;

import "ds-test/test.sol";

import "./GovPollingGenerator.sol";

contract GovPollingGeneratorTest is DSTest {
    GovPollingGenerator generator;

    function setUp() public {
        generator = new GovPollingGenerator();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}

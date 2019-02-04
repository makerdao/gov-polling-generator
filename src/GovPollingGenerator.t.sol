pragma solidity ^0.5.2;

import "ds-test/test.sol";

import "./GovPollingGenerator.sol";

contract GovPollingGeneratorTest is DSTest {
    GovPollingGenerator generator;

    function setUp() public {
        generator = new GovPollingGenerator();
    }

    function testCreatePoll() public {
        uint pollId1 = generator.createPoll();
        uint pollId2 = generator.createPoll();
        uint pollId3 = generator.createPoll();
        assertEq(pollId1, 0);
        assertEq(pollId2, 1);
        assertEq(pollId3, 2);

        (address yes1, address no1) = generator.polls(pollId1);
        (address yes2, address no2) = generator.polls(pollId2);
        (address yes3, address no3) = generator.polls(pollId3);

        assertTrue(yes1 != address(0));
        assertTrue(yes2 != address(0));
        assertTrue(yes3 != address(0));
        assertTrue(no1 != address(0));
        assertTrue(no2 != address(0));
        assertTrue(no3 != address(0));
        assertTrue(yes1 != yes2);
        assertTrue(yes1 != yes3);
        assertTrue(yes2 != yes3);
        assertTrue(no1 != no2);
        assertTrue(no1 != no3);
        assertTrue(no2 != no3);
    }
}

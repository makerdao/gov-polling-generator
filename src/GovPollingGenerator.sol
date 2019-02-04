/// GovPollingGenerator.sol

// Copyright (C) 2019 Gonzalo Balabasquer <gbalabasquer@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity ^0.5.2;

contract VoteYes {}

contract VoteNo {}

contract GovPollingGenerator {
    Poll[] public polls;
    uint public polli;

    event LogNewPoll(uint, address, address);

    struct Poll {
        address voteYes;
        address voteNo;
    }

    function createPoll() public returns (uint pollId){
        address yes = address(new VoteYes());
        address no = address(new VoteNo());
        pollId = polls.length;
        emit LogNewPoll(pollId, yes, no);
        polls.push(Poll(yes, no));
    }
}

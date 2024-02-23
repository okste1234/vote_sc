// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./VotingPoll.sol";

contract VotingPollFactory {
    VotingPoll[] voteClones;

    function createMultiSigWallet()
        external
        returns (VotingPoll newVote_, uint256 length_)
    {
        newVote_ = new VotingPoll();

        voteClones.push(newVote_);

        length_ = voteClones.length;
    }

    function getMultiSigClones() external view returns (VotingPoll[] memory) {
        return voteClones;
    }
}

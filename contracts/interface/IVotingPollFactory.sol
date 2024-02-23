// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "../VotingPoll.sol";

interface IVotingPollFactory {
    function createMultiSigWallet()
        external
        returns (VotingPoll newVote_, uint256 length_);

    function getMultiSigClones() external view returns (VotingPoll[] memory);
}

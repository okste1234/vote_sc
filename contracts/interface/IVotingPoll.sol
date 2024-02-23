// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IVotingPoll {
    function createPoll(
        string memory _question,
        string[] memory _options
    ) external;

    function vote(uint256 _pollId, uint256 _option) external;

    function getVoterChoice(
        uint256 _pollId
    ) external view returns (string memory);

    function AllOPtions() external view returns (uint[] memory);
}

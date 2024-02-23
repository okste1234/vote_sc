// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingPoll {

    uint256 counts;

    struct Poll {
        uint256 id;
        string question;
        string[] options;
    }

    uint256[] allOptions;

    mapping(uint => Poll) votePoll;

    mapping(uint => uint256) voteOption;

    mapping(address => mapping(uint256 => bool)) public hasVotedOnPoll;

    function createPoll(string memory _question, string[] memory _options) external {
        require(_options.length > 1, "At least two options are required");

        uint pollCount = counts + 1;
        
        Poll storage newPoll = votePoll[pollCount];

        newPoll.id = pollCount;
        newPoll.question = _question;
        newPoll.options = _options;

        counts++;
    }

    function vote(uint256 _pollId, uint256 _option) external {
        require(!hasVotedOnPoll[msg.sender][_pollId], "You have already voted on this poll");

        Poll memory votez = votePoll[_pollId];
        require(_option < votez.options.length, "Invalid option choice" );

        hasVotedOnPoll[msg.sender][_pollId] = true;

        voteOption[_pollId] = _option;

        allOptions.push(_option);
    }

    function getVoterChoice(uint256 _pollId) external view returns (string memory) {
        require(_pollId <= counts, "Invalid poll ID");
        require(hasVotedOnPoll[msg.sender][_pollId], "You have not voted on this poll");

        return votePoll[_pollId].options[voteOption[_pollId]];
    }

    function AllOPtions() external view returns(uint[] memory){
        return allOptions;
    }

}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract to manage user profiles
contract Profile {
    // Structure to store user profile details
    struct UserProfile {
        string displayName; // User's display name
        string bio; // User's biography
    }

    // Mapping from user address to their profile
    mapping(address => UserProfile) public profiles;

    // Function to set or update the profile of the caller
    function setProfile(string memory _displayName, string memory _bio) public {
        // Update the profile for the caller with the provided display name and bio
        profiles[msg.sender] = UserProfile(_displayName, _bio);
    }

    // Function to get the profile of a specific user
    function getProfile(
        address _user
    ) public view returns (UserProfile memory) {
        // Return the profile details for the given user address
        return profiles[_user];
    }
}

import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

// Define an interface for user profiles
interface IProfile {
    // Define a structure for user profiles
    struct UserProfile {
        string displayName; // User's display name
        string bio; // User's biography
    }

    // Function to get a user's profile by address
    function getProfile(
        address _user
    ) external view returns (UserProfile memory);
}

// Main contract for managing tweets
contract Twitter is Ownable {
    uint16 public MAX_TWEET_LENGTH = 280; // Maximum length of a tweet

    // Structure for a tweet
    struct Tweet {
        uint256 id; // Unique ID of the tweet
        address author; // Address of the tweet's author
        string content; // Content of the tweet
        uint256 timestamp; // Timestamp when the tweet was created
        uint256 likes; // Number of likes the tweet has received
    }

    // Mapping from an address to a list of tweets
    mapping(address => Tweet[]) public tweets;
    // Reference to the profile contract
    IProfile profileContract;

    // Events to log important actions
    event TweetCreated(
        uint256 id,
        address author,
        string content,
        uint256 timestamp
    );
    event TweetLiked(
        address liker,
        address tweetAuthor,
        uint256 tweetId,
        uint256 newLikeCount
    );
    event TweetUnliked(
        address unliker,
        address tweetAuthor,
        uint256 tweetId,
        uint256 newLikeCount
    );

    // Modifier to check if the user is registered
    modifier onlyRegistered() {
        IProfile.UserProfile memory userProfileTemp = profileContract
            .getProfile(msg.sender);
        require(
            bytes(userProfileTemp.displayName).length > 0,
            "USER NOT REGISTERED"
        );
        _;
    }

    // Constructor to set the address of the profile contract
    constructor(address _profileContract) {
        profileContract = IProfile(_profileContract);
    }

    // Function to change the maximum tweet length (only callable by the owner)
    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    // Function to get the total number of likes for all tweets of a specific author
    function getTotalLikes(address _author) external view returns (uint) {
        uint totalLikes;

        // Loop through all tweets of the author and sum their likes
        for (uint i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }

        return totalLikes;
    }

    // Function to create a new tweet (only callable by registered users)
    function createTweet(string memory _tweet) public onlyRegistered {
        require(
            bytes(_tweet).length <= MAX_TWEET_LENGTH,
            "Tweet is too long bro!"
        );

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

        // Emit an event when a new tweet is created
        emit TweetCreated(
            newTweet.id,
            newTweet.author,
            newTweet.content,
            newTweet.timestamp
        );
    }

    // Function to like a tweet (only callable by registered users)
    function likeTweet(address author, uint256 id) external onlyRegistered {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");

        tweets[author][id].likes++;

        // Emit an event when a tweet is liked
        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    // Function to unlike a tweet (only callable by registered users)
    function unlikeTweet(address author, uint256 id) external onlyRegistered {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET HAS NO LIKES");

        tweets[author][id].likes--;

        // Emit an event when a tweet is unliked
        emit TweetUnliked(msg.sender, author, id, tweets[author][id].likes);
    }

    // Function to get a specific tweet by its index
    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    // Function to get all tweets of a specific user
    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}

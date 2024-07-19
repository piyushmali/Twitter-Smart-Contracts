# 🐦 Twitter-Smart-Contracts

Welcome to the Twitter-Smart-Contracts repository! 🚀 This project features Solidity smart contracts that bring a Twitter-like experience to the Ethereum blockchain. Our main contract, `Twitter`, empowers users to create, like, and unlike tweets, while the `Profile` contract manages user profiles. Dive into the world of blockchain-based social media with us!

## 📜 Contracts Overview

### 1. **Twitter (twitter-main.sol)**

The `Twitter` contract is the heart of our decentralized Twitter clone. Here’s what you can do with it:

#### 🚀 **Functions:**

- **`constructor(address _profileContract)`**

  - Sets up the `Twitter` contract with the `Profile` contract's address.

- **`changeTweetLength(uint16 newTweetLength)`**

  - Adjust the maximum tweet length (only the owner can do this).

- **`getTotalLikes(address _author)`**

  - Get the total likes for a specific author.

- **`createTweet(string memory _tweet)`**

  - Post a new tweet (only registered users can tweet).

- **`likeTweet(address author, uint256 id)`**

  - Like a tweet from a specific author (only registered users).

- **`unlikeTweet(address author, uint256 id)`**

  - Unlike a tweet from a specific author (only registered users).

- **`getTweet(uint _i)`**

  - Retrieve a tweet by its index.

- **`getAllTweets(address _owner)`**
  - Fetch all tweets from a given owner.

#### 📢 **Events:**

- **`TweetCreated(uint256 id, address author, string content, uint256 timestamp)`**

  - Triggered when a new tweet is created.

- **`TweetLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount)`**

  - Fired when a tweet is liked.

- **`TweetUnliked(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount)`**
  - Emitted when a tweet is unliked.

### 2. **Profile (twitter-user.sol)**

The `Profile` contract is all about managing user profiles.

#### 🚀 **Functions:**

- **`setProfile(string memory _displayName, string memory _bio)`**

  - Update your profile with a display name and bio.

- **`getProfile(address _user)`**
  - Retrieve the profile details of any user.

## 🚀 Getting Started

### Prerequisites

- Solidity ^0.8.0
- Node.js (with npm)
- Truffle or Hardhat for smart contract development and testing

### Installation

1. Clone the repository:

```bash
git clone https://github.com/piyushmali/Twitter-Smart-Contracts.git
cd Twitter-Smart-Contracts
```

2. Install dependencies:

```bash
npm install
```

### Compilation

Compile the contracts with your preferred tool:

```bash
truffle compile
```

or

```bash
npx hardhat compile
```

### Deployment

Deploy the contracts to your chosen Ethereum network:

```bash
truffle migrate --network <network_name>
```

or

```bash
npx hardhat run scripts/deploy.js --network <network_name>
```

### Testing

Ensure everything works perfectly by running the tests:

```bash
truffle test
```

or

```bash
npx hardhat test
```

## 🌟 Usage

1. Deploy the `Profile` contract.
2. Deploy the `Twitter` contract using the address of the deployed `Profile` contract.
3. Users can now set up their profiles with the `setProfile` function.
4. Interact with tweets by creating, liking, and unliking through the `Twitter` contract functions.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

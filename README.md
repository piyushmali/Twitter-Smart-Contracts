# Twitter-Smart-Contracts

This repository contains Solidity smart contracts that implement a Twitter-like application on the Ethereum blockchain. The main contract, `Twitter`, allows users to create, like, and unlike tweets. The `Profile` contract manages user profiles.

## Contracts Overview

### 1. Twitter (twitter-main.sol)

The `Twitter` contract allows users to create, like, and unlike tweets. Only registered users can interact with tweets.

#### Functions:

- **constructor(address _profileContract)**
  - Initializes the contract with the address of the `Profile` contract.

- **changeTweetLength(uint16 newTweetLength)**
  - Changes the maximum tweet length. Only the contract owner can call this function.

- **getTotalLikes(address _author)**
  - Returns the total number of likes for a given author.

- **createTweet(string memory _tweet)**
  - Creates a new tweet. Only registered users can call this function.

- **likeTweet(address author, uint256 id)**
  - Likes a tweet by the given author and ID. Only registered users can call this function.

- **unlikeTweet(address author, uint256 id)**
  - Unlikes a tweet by the given author and ID. Only registered users can call this function.

- **getTweet(uint _i)**
  - Returns the tweet of the sender at index `_i`.

- **getAllTweets(address _owner)**
  - Returns all tweets of the specified owner.

#### Events:

- **TweetCreated(uint256 id, address author, string content, uint256 timestamp)**
  - Emitted when a tweet is created.

- **TweetLiked(address liker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount)**
  - Emitted when a tweet is liked.

- **TweetUnliked(address unliker, address tweetAuthor, uint256 tweetId, uint256 newLikeCount)**
  - Emitted when a tweet is unliked.

### 2. Profile (twitter-user.sol)

The `Profile` contract manages user profiles.

#### Functions:

- **setProfile(string memory _displayName, string memory _bio)**
  - Sets the profile for the caller with the given display name and bio.

- **getProfile(address _user)**
  - Returns the profile of the given user.

## Getting Started

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

Compile the contracts using Truffle or Hardhat:

```bash
truffle compile
```

or

```bash
npx hardhat compile
```

### Deployment

Deploy the contracts to your desired network:

```bash
truffle migrate --network <network_name>
```

or

```bash
npx hardhat run scripts/deploy.js --network <network_name>
```

### Testing

Run the tests to ensure the contracts behave as expected:

```bash
truffle test
```

or

```bash
npx hardhat test
```

## Usage

1. Deploy the `Profile` contract.
2. Deploy the `Twitter` contract with the address of the deployed `Profile` contract.
3. Users can set up their profiles using the `setProfile` function in the `Profile` contract.
4. Users can create, like, and unlike tweets using the `Twitter` contract functions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

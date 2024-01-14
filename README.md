# AVAX_MOD-4

# My Awesome Token

This Solidity program implements a simple ERC-20 token contract called `MyAwesomeToken`. The purpose of this token is to showcase basic functionalities of ERC-20 tokens, including minting, transferring, burning, and redeeming items.

## Description

The contract inherits from OpenZeppelin's `ERC20` and `Ownable` contracts, providing standard ERC-20 token features and ownership functionalities. The token includes the ability to mint new tokens, transfer tokens, redeem items based on specific redemption codes, view the account balance, and burn tokens.

## Getting Started

### Prerequisites

To deploy and interact with this contract, you'll need the following:

- Solidity development environment
- Basic knownlegde of using Remix IDE https://remix.ethereum.org/


### Deployment

1. Deploy the contract by compiling and deploying using a development environment like Remix.
2. After deploying it select in injected provider in deploying
3. connect to metamask wallet
4. connect account with AVAX TESTNET
5. if there is error go to complier and then goto advance and set london in the place of default
6. Once deployed, the contract owner can mint tokens to a specified address using the `mintTokens` function.
7. Users can transfer tokens using the `transferTokens` function.
8. Users can redeem items using the `redeemItem` function by providing a valid redemption code.
9. Users can check their account balance using the `viewAccountBalance` function.
10. Users can burn their tokens using the `burnTokens` function.

## Redeemable Items

The contract supports the redemption of items with specific codes, each corresponding to a different tier. The redemption codes and their corresponding tiers are as follows:

- 1012: Nebula Elite
- 2023: Quantum Vanguard
- 3035: Celestial Phoenix
- 4005: Galactic Voyager

## Authors

Metacrafter Chris  
[@Rish_21_](https://twitter.com/rish_21_)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyAwesomeToken is ERC20, Ownable {

    string[] public tierNames = ["Nebula Elite", "Quantum Vanguard", "Celestial Phoenix", "Galactic Voyager"];

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address to, uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient Tokens, please try again");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }

    function redeemItem(uint toRedeem) public returns (string memory) {
        require(balanceOf(msg.sender) >= 50, "Insufficient Tokens, please try again");

        if (balanceOf(msg.sender) >= 1050 && toRedeem == 1012) {
            _burn(msg.sender, 150);
            return tierNames[3];
        } else if (balanceOf(msg.sender) >= 100 && toRedeem == 2023) {
            _burn(msg.sender, 1000);
            return tierNames[2];
        } else if (balanceOf(msg.sender) >= 50 && toRedeem == 3035) {
            _burn(msg.sender, 500);
            return tierNames[1];
        } else if (balanceOf(msg.sender) >= 10 && toRedeem == 4005) {
            _burn(msg.sender, 100);
            return tierNames[0];
        } else {
            return "Put a Valid redemption code";
        }
    }

    function viewAccountBalance() public view returns (uint) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient Tokens, please try again");
        _burn(msg.sender, amount);
    }
}

```


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyAwesomeToken is ERC20, Ownable {

    string[] public tierNames = ["Nebula Elite", "Quantum Vanguard", "Celestial Phoenix", "Galactic Voyager"];

    constructor() ERC20("Awesome_Token", "AWT") Ownable(msg.sender) {}

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

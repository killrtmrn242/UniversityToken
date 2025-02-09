// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import OpenZeppelin’s ERC20 implementation and utility libraries.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract UniversityToken is ERC20 {
    using Strings for uint256;

    // State variables to record the details of the last token transfer.
    address private lastSender;
    address private lastReceiver;
    uint256 private lastAmount;
    uint256 private lastTimestamp;

    constructor() ERC20("UniversityToken", "UGT") {
        // Mint an initial supply of 2000 tokens (with 18 decimals).
        // 2000 * 10^18 is the smallest-unit amount.
        _mint(msg.sender, 2000 * 10 ** decimals());
    }

    /**
     * @dev Override the internal _transfer function from ERC20.
     * This ensures that every time a transfer occurs, the contract
     * stores the sender, receiver, amount, and the current block timestamp.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual override {
        // Execute the normal ERC20 transfer.
        super._transfer(sender, recipient, amount);

        // Update the transaction information.
        lastSender = sender;
        lastReceiver = recipient;
        lastAmount = amount;
        lastTimestamp = block.timestamp;
    }

    /**
     * @notice Returns the last transaction information as a tuple.
     * @return sender The address that sent the tokens.
     * @return receiver The address that received the tokens.
     * @return amount The amount of tokens transferred.
     * @return timestamp The block timestamp when the transfer occurred.
     */
    function getLastTransactionInfo()
        external
        view
        returns (
            address sender,
            address receiver,
            uint256 amount,
            uint256 timestamp
        )
    {
        return (lastSender, lastReceiver, lastAmount, lastTimestamp);
    }

    /**
     * @notice Returns the block timestamp of the latest transaction in a human‑readable format.
     * @dev For demonstration purposes, we return a string that simply prefixes the Unix timestamp.
     */
    function getLatestTransactionDateTime() external view returns (string memory) {
        return string(abi.encodePacked("Latest Transaction Timestamp (Unix): ", lastTimestamp.toString()));
    }

    /**
     * @notice Retrieves the address of the sender of the last transaction.
     */
    function getLastTransactionSender() external view returns (address) {
        return lastSender;
    }

    /**
     * @notice Retrieves the address of the receiver of the last transaction.
     */
    function getLastTransactionReceiver() external view returns (address) {
        return lastReceiver;
    }
}

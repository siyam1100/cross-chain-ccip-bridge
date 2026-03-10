// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {CCIPReceiver} from "@chainlink/contracts-ccip/src/v0.8/ccip/applications/CCIPReceiver.sol";
import {Client} from "@chainlink/contracts-ccip/src/v0.8/ccip/libraries/Client.sol";

/**
 * @title CCIPReceiver
 * @dev Contract for receiving cross-chain messages.
 */
contract MyCCIPReceiver is CCIPReceiver {
    event MessageReceived(
        bytes32 indexed messageId,
        uint64 indexed sourceChainSelector,
        address sender,
        string text
    );

    constructor(address router) CCIPReceiver(router) {}

    function _ccipReceive(Client.Any2EVMMessage memory any2EvmMessage) internal override {
        bytes32 messageId = any2EvmMessage.messageId;
        uint64 sourceChainSelector = any2EvmMessage.sourceChainSelector;
        address sender = abi.decode(any2EvmMessage.sender, (address));
        string memory text = abi.decode(any2EvmMessage.data, (string));

        emit MessageReceived(messageId, sourceChainSelector, sender, text);
    }
}

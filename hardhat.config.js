require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  solidity: "0.8.0",
  networks: {
    holesky: {
      url: process.env.HOLESKY_RPC_URL, // URL RPC Holesky (получите его от Infura, Alchemy или другого провайдера)
      accounts: [process.env.PRIVATE_KEY] // Ваш приватный ключ от MetaMask
    }
  }
};

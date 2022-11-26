require("@nomiclabs/hardhat-waffle")

require("dotenv").config()

module.exports = {
  solidity: "0.8.0",
  networks: {
    goerli: {
      // This value will be replaced on runtime
      url: process.env.STAGING_QUICKNODE_KEY,
      accounts: [process.env.PRIVATE_KEY],
    },
    mainnet: {
      url: process.env.PROD_QUICKNODE_KEY,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
}

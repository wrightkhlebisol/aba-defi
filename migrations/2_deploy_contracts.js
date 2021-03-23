const ABCToken = artifacts.require("ABCToken");
const cABCToken = artifacts.require("cABCToken");

module.exports = function (deployer) {
    // Deploy ABCToken
    await deployer.deploy(ABCToken);
    // Get deployed instance
    let abcToken = await ABCToken.deployed()

    // Deploy cABCToken
    await deployer.deploy(cABCToken, abcToken.address);
    let cabcToken = cABCToken.deployed();
};

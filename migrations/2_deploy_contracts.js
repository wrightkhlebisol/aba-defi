const ABCToken = artifacts.require("ABCToken");

module.exports = function (deployer) {
    await deployer.deploy(ABCToken);
};

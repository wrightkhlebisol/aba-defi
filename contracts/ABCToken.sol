// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ABCToken is ERC20{
    constructor() public ERC20("ABCToken","ABC") {}
    
    event tokenMinted(address indexed minter, uint256 indexed amount);
     
    /**
     * @dev buys specified amount of ABCToken
    */
    function buyABCToken (uint256 _amount) public {
        // Format amount to prevailing decimal
        uint256 __amount = _amount * 10**18;
        
        require(__amount <= 50 ether, "Can only mint 50 ether or less at a go");
        // mint specified amout to sender
        _mint(msg.sender, __amount);
        emit tokenMinted(msg.sender, __amount);
    }
}

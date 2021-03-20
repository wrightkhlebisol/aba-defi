// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ABCToken is ERC20{
    constructor() ERC20("ABCToken","ABC") {}
    
    event tokenMinted(address minter, uint256 amount);
     
    function buyABCToken (uint256 _amount) public {
        require(_amount > 0, "You can't purchase 0 or less token");
        // Format amount to prevailing decimal
        uint256 __amount = _amount * 10**18;
        
        // mint specified amout to sender
        _mint(msg.sender, __amount);
        emit tokenMinted(msg.sender, __amount);
    }
}

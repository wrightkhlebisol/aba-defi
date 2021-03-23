// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract cABCToken is ERC20 {

  using Address for address;
  using SafeMath for uint256;
  using SafeERC20 for IERC20;

  IERC20 public token;

  constructor(address _token) public
    ERC20('cABCToken', 'cABC') 
  {
    token = IERC20(_token);
  }

  /**
  * @dev Get total of ABCToken locked in contract (TVL)
  * @return uint256 tokenbalance
  *
  */
  function getABCTVL() public view returns(uint256){
    return token.balanceOf(address(this));
  }
  
  function approveCABC(uint256 _amount) public returns (uint256){
    token.approve(address(token), _amount);
    return token.allowance(msg.sender, address(this));
  }
  
  function getABCTokAllowance() public view returns(uint256){
      return token.allowance(msg.sender, address(this));
  }
  
  function getSenderBalance() public view returns (uint256){
    return token.balanceOf(msg.sender);
  }

  /**
  * @dev Receives ABCToken and mints cABCToken
  * 
  */
  function deposit(uint256 _amount) public {
    // Amount must be greater than 0;
    require(_amount > 0, "amount cannot be 0");
    
    // Transfer ABCToken to smart contract
    token.safeTransferFrom(msg.sender, address(this), _amount);

    // Mint equivalent cABCToken to msg.sender
    _mint(msg.sender, _amount);

  }
  
  function withdraw(uint256 _amount) public {
    //   Burn cABCToken amount from msg sender
    _burn(msg.sender, _amount);
    
    // Transfer ABCToken from address(this) to msg sender
    token.safeTransfer(msg.sender, _amount);
  }
  
  /**
   * @dev returns APY or APR for staked token
  */
  // function calculateAPY(uint256 _depositAmount) public view returns(uint256){
  //     uint 
  //     return _depositAmount.mul(15/100);
  // }
}

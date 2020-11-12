pragma solidity ^0.6.0;

contract Task2{

    address owner;
    uint256 deadline;
    
    
    mapping(address => uint) mybalance;
    
    constructor() public
    {
        uint256 deadline = 1605201660;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    

    function deposit () public payable 
    {
        uint256 _oldBal = mybalance[msg.sender];
        uint256 _newBal = _oldBal + msg.value;
        mybalance[msg.sender] = _newBal;

    }
    
    function withdraw () public  
    {
        require(now > deadline);
        address payable _receiver = msg.sender;
        _receiver.transfer(mybalance[msg.sender]);
        mybalance[msg.sender] = 0;
    }
    
    function balanceCheck() external view returns(uint){
        return address(this).balance;
    }
    
    function updateDeadline (uint256 _time) external onlyOwner {
        deadline =  _time;
    }

   
    
    
}

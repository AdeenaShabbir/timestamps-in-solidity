pragma solidity ^0.6.0;

contract Ownable {
    address payable private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address payable) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

   
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

 
}

contract Timestamp is Ownable{

    uint256 deadline;
    
    
    mapping(address => uint) mybalance;
    
    constructor() public
    {
        uint256 deadline = 1605201660;
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
    
    function checkBalance() external view returns(uint){
        return address(this).balance;
    }
    
    function updateDeadline (uint256 _time) external onlyOwner {
        deadline =  _time;
    }

   
    
    
}

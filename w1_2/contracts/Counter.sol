pragma solidity ^0.8.7;

contract Counter {

    uint256 count;


    constructor(uint256 _count){
        count = _count;
    }

    function getCount() public view returns(uint256)  {
        return count;
    }

    function add(uint256 x) public {
        count += x;
    }

}
pragma solidity ^0.5.0;

contract cert{

    struct cert_details{
        string name;
        string course;
        string school;
        bytes32 certid;
    }
    
    mapping(address=>cert_details) certificates;
    
    address owner;
    constructor() public {
        owner=msg.sender;
    }
    modifier ownerOnly{
        require(owner==msg.sender);
        _;
    }
    

    event certadded(string name,string course,string school,bytes32 certid);
    

    function viewcert(address sender) view public returns(string memory name,string memory course,string memory school,bytes32 certid){
        return (certificates[sender].name,certificates[sender].course,certificates[sender].school,certificates[sender].certid);
    }
    
    function addcert(string memory name,string memory course,string memory school) public {
        bytes32 certid;
        certid=keccak256(abi.encodePacked(name,course,school));
        certificates[msg.sender]=cert_details(name,course,school,certid);
    }          
 }
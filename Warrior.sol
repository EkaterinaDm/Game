pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "WarUnit.sol";

contract Warrior is WarUnit {

    uint attackWarrior = 8;
    uint protectionWarrior = 2;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        attack = attackWarrior;
        protection = protectionWarrior;
    }
    
    // получить силу атаки для воина
    function takePowerOfAttack() virtual public override returns (uint attack) {
        tvm.accept();
        return attackWarrior;
    }

    // получить силу защиты  для воина
    function takePowerOfProtection() virtual public override returns (uint protection) {
        tvm.accept();
        return protectionWarrior;
    }

}

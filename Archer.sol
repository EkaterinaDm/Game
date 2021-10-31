pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "WarUnit.sol";

contract Archer is WarUnit{

    uint attackArcher = 5;
    uint protectionArcher = 1;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        attack = attackArcher;
        protection = protectionArcher;
    }

    // получить силу атаки для лучника
     function takePowerOfAttack() virtual public override returns (uint attack) {
        tvm.accept();
        return attackArcher;
    }

    // получить силу защиты для лучника
    function takePowerOfProtection() virtual public override returns (uint protection) {
        tvm.accept();
        return protectionArcher;
    }

}

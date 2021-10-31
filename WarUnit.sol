pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObject.sol";

contract WarUnit is GameObject{

    uint attack;
    
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    // получить силу атаки для юнита
    function takePowerOfAttack() virtual public returns (uint attack) {
        tvm.accept();
        return attack;
    }

    // получить силу защиты для юнита
    function takePowerOfProtection() virtual public override returns (uint protection) {
        tvm.accept();
        return protection;
    }

    // получить текущее здоровье
    function takeLives() virtual public returns(uint livesLeft){
        tvm.accept();
        return lives;
    }

    // атаковать соперника (передаем адрес того, котого хотим атаковать)
    function Attack(InterfaceGameObject addressAttack) virtual public{
        tvm.accept();
        addressAttack.takeAttack(attack); // вызываем функцию от адреса контракта противника        
    }

    // обработка гибели юнита
    function deathHandling(address dest) virtual public override{
        tvm.accept();  
        selfDestruction(dest); 
    } 

}

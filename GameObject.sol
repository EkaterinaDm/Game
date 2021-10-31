
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "InterfaceGameObject.sol";

contract GameObject is InterfaceGameObject {
    
    uint lives = 10;
    address addressAttacking;
    uint damage;
    uint protection;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    // получить силу защиты 
    function takePowerOfProtection() virtual public returns (uint protection){
        return protection;
    }

    // принять атаку
    function takeAttack(uint powerAttack) virtual external override {
        tvm.accept();
        addressAttacking = msg.sender; // получаем адрес того, кто атаковал
        damage = powerAttack - protection;
        if (damage > lives) {
            lives = 0;
        } else { 
            lives = lives - damage;
        }
        checkKilled(addressAttacking);
    }

    // проверить, убит ли объект
    function checkKilled(address obj) private{
        tvm.accept();
        if (lives == 0) {
            deathHandling(obj);
        }
    }

    // обработка гибели
    function deathHandling(address dest) virtual public {
        tvm.accept();
        selfDestruction(dest);
    }

    // отправка всех денег по адресу и уничтожения
    function selfDestruction(address dest) public {
        tvm.accept();
        dest.transfer(0, true, 160);
    }
}

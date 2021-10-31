pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface InterfaceGameObject {
   
   // принять атаку
   function takeAttack(uint powerAttack) external;      
}

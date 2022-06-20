// import ICP libraries
// inspect debug print/trap 
import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

// money = Float not Nat type

actor Cash_cow {
  // orthogonal persistance perserve state in canister
  // stable vs flexible variables, hold on state of variables
  stable var currentValue: Float = 300;
  // change variable
  //currentValue := 100;

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show());

  // constant
  let id = 31231231231;
  // Debug.print(debug_show(id));

  // topUp();
  // private vs public function, only called withint actor
  // add public
  public func topUp(amount: Float) {
    currentValue += amount; 
    Debug.print(debug_show(currentValue));
  };

  // allow users to withdrawl an amoutn fomr the currentValue
  // decrease the currentValue by the amount

  public func withdrawl(amount: Float) {
    // datatype
    let tempValue: Float = currentValue - amount;
    if (currentValue - amount >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else{
      Debug.print("Amount withdrawl too large, natural selection underflow currentvalue less than 0")
    }
      // natural selection underflow, conditional withdrawl money you don't have 
    
  };

  // async output query calls adapted without blockchain modification v.s. update calls consensis on blockchain
  public query func checkBalance(): async Float {
    return currentValue;
  };


  // compound interest calls time module

  public func compound() {
    let currentTime = Time.now();
    // nano seconds
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS =timeElapsedNS / 1000000000;
   //float
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime; 
  };
}
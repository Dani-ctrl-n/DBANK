import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue:Float = 300; // By default you dont need natural value (Nat) when it's a positive number 
  // stable is an Orth persistance.. it saves the currentValue after topUp or Withdraw
  currentValue := 100;
  Debug.print(debug_show(currentValue));

  let startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 5674289023;

  // Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;

    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;

      Debug.print(debug_show(currentValue))
    } else {
      Debug.print("The amount is larger than the balance.")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func timeElapsed() {
    let currentTime = Time.now()
  }

  // topUp();
}
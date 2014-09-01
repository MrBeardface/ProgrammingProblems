function min(firstNumber, secondNumber) {
  if(firstNumber <= secondNumber){
    return firstNumber
  } else {
    return secondNumber
  }
}

console.log(min(9, 10));
// → 0
console.log(min(0, -10));
// → -10
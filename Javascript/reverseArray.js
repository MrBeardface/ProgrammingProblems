function reverseArray(array){
  arrays = []
  for(i = array.length - 1; i >= 0; i--) {
    arrays.push(array[i]);
  }
  return arrays;
}

console.log(reverseArray(["A", "B", "C"]));

function reverseArrayInPlace(array) {
  for (var i = 0; i < Math.floor(array.length / 2); i++) {
    var old = array[i];
    array[i] = array[array.length - 1 - i];
    array[array.length - 1 - i] = old;
  }
  return array;
}

var arrayValue = [1, 2, 3, 4, 5];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);

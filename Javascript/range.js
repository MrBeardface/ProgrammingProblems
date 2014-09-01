function range(start, end){
  var numbers = [];
  for(i=start; i <= end; i++){
    numbers.push(i);
  }
  return numbers;
}

function sum(){
  var begin = 0;
  for(i = 1; i <= 10; i++){
  begin += i  
  }
  return begin
}

function range(start, end, step) {
  if (step == null) step = 1;
  var array = [];

  if (step > 0) {
    for (var i = start; i <= end; i += step)
      array.push(i);
  } else {
    for (var i = start; i >= end; i += step)
      array.push(i);
  }
  return array;
}

console.log(range(1,10));
console.log(sum(range(1, 10)));
// → 55
console.log(range(5, 2, -1));
// → [5, 4, 3, 2]
n = prompt("Please choose a number between 1 and 1000.")

for(i = 1; i < n; i++){
	if (i % 3 === 0 && i % 5 === 0){
		console.log("FizzBuzz");
	} else if (i % 5 === 0){
		console.log("Buzz");
	} else if (i % 3 === 0){
		console.log("Fizz");
	} else {
		console.log(i);
	}
}

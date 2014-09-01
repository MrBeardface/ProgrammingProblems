function countBs(string) {
  for(i = 0; i < string.length; i++){
    if(string.charAt(i) == "B")
      	count = 0
		count += 1
  }
    return count
}

function countChar(string, letter) {
 var stuff = 0
  for(i = 0; i < string.length; i++) {
    if(string.charAt(i) == letter)
        stuff += 1
  }
    return stuff
}

console.log(countBs("BBC"));
// → 2
console.log(countChar("kakkerlak", "k"));
// → 4
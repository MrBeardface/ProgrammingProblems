var arrays = [[1, 2, 3], [4, 5], [6]];
// Your code here.
var flattenArray = function  (a) {
	return arrays.reduce(function (i,c) {
  		return i.concat(c);
	})
}
console.log(flattenArray(arrays))
// → [1, 2, 3, 4, 5, 6]
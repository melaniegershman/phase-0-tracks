/* ========= RELEASE 0 - FIND THE LONGEST PHRASE
Input: take an array
Find the length of each of the strings inside it
Store lengths in another array; find the largest number in that array
Find the index of the largest number
Use that index to find the longest phrase in the array
Output: the longest phrase
*/

var phraseArr = ["long phrase","longest phrase","longer phrase","def longest phrase"]

function longestPhrase(arr) {
	var phraseLengthArr;
	//create new array with lengths of each array item
	phraseLengthArr = arr.map(
		function(phrase) { 
			return phrase.length; 
		}
	);
	// find the largest number in the length array
	var max = Math.max(...phraseLengthArr)
	// find index of largest number in the length array
	var maxIndex = phraseLengthArr.indexOf(max);
	// use the index of the largest number in length array to find longest phrase in original input array
	return arr[maxIndex];
}
/* Another way to find the longest phrase:

function longestPhrase(arr) {
	var longestStr = '';
	for (var i = 0; i < arr.length; i++) {
		if (arr[i].length > longestStr.length)
			longestStr = arr[i];
	}
	return longestStr;
}
*/
// ========= DRIVER CODE: =========
// console.log(longestPhrase(phraseArr))

/* ========= RELEASE 1 - FIND A KEY-VALUE MATCH
- Input: two data structures
Iterate to compare keys in each hash
Each loop compares a kay to another key
If keys equal and if values are equal, then return true
Otherwise, return false
- Output: boolean value
*/

function keyValMatch(objOne, objTwo) {
	for (var objOneKey in objOne) {
		for (var objTwoKey in objTwo) {
			if (objOneKey === objTwoKey && objOne[objOneKey] === objTwo[objTwoKey]) { 
				return true;
			}
		}
	}
	return false
}
// ========= DRIVER CODE: =========
// objOne = {cat: "Spot", dog: "Fido", snake: "Slippy", turtle: "turt"}
// objTwo = {cat: "Fluffy", dog: "Spot", snake: "Mr. Slithers", turtle: "hank"}
// console.log(keyValMatch(objOne, objTwo))

/* ========= RELEASE 2 - GENERATE RANDOM TEST DATA
Write a function that takes an integer for length, and builds and returns an array of strings of the given length. 
- Input: integer
- Set integer as length of an array
- Set empty array to print as output
- While empty array is less than the input array length, push a random word in (the index will be a random number)
- Output: an array of strings [ex: function(3) => ["blah", "beep", "boop"]]
*/


function randomWords(n) {
	var randomArr = [];
	for (var i = 0; i < n; i++) {
		var alpha = "abcdefghijklmnopqrstuvwxyz";
		var str = ""
		for (var j = 0; j < Math.floor((Math.random() * 11) + 1); j++) {
			str += alpha.charAt(Math.floor(Math.random() * alpha.length));
		}
		randomArr.push(str)
	}
	return randomArr;
}
// ========= DRIVER CODE: =========

/*
Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.
*/

for (i = 0; i <= 10; i++) {
  // random # of words for array
  var number = (Math.floor(Math.random() * 10) + 1)
  // store array
  console.log("=============================")
  console.log("The length of the array is " + number) + "."
  var wordArr = randomWords(number);
  console.log(wordArr);
  var longestStr = longestPhrase(wordArr);
  console.log("The longest word is: " + longestStr + " it is " + longestStr.length + " characters long.");
}
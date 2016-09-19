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
	var words = ["blah", "this", "that", "allegory", "jack", "green", "sugar", "cat", "puppy", "a", "the", "an", "thing", "as", "if", "do", "do not", "filter", "photograph", "startup"];
	var randomArr = [];
	while (randomArr.length < n) {
		var index = Math.floor((Math.random() * words.length) + 1);
		randomArr.push(words[index]);
		// n = n + 1;
	}
	return randomArr;
}
// ========= DRIVER CODE: =========
// console.log(randomWords(4))

/*
Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.

// 9/19 - 11:15 AM: ERROR:
Returns /Users/melaniegershman/devbootcamp/phase-0-tracks/js/algos.js:17
			return phrase.length; 
			             ^

TypeError: Cannot read property 'length' of undefined
*/

for (i = 0; i <= 10; i++) {
  // random # of words for array
  var number = (Math.floor(Math.random() * 15) + 1)
  // store array
  // var wordArr = randomWords(number);
  console.log(randomWords(number));
  console.log("The longest word is: " + longestPhrase(randomWords(number)));
}
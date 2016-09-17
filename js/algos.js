/* RELEASE 0 - FIND THE LONGEST PHRASE
Take an array and find the length of each of the strings inside it
Find the index of the largest number
Use that index to find the longest phrase in the array
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
// another way to find the longest phrase
// function longestPhrase(arr) {
// 	var longestStr = '';
// 	for (var i = 0; i < arr.length; i++) {
// 		if (arr[i].length > longestStr.length)
// 			longestStr = arr[i];
// 	}
// 	return longestStr;
// }

console.log(longestPhrase(phraseArr))

/* RELEASE 1 - FIND A KEY-VALUE MATCH
a function that takes two objects and checks to see if the objects share at least one key-value pair. 
If no pairs match (and keep in mind that the two objects may not even have any of the same keys), the function should return false. 
To make your life easier, don't worry about whether a property is a string ('age') or an identifier name (age). Those can be considered equivalent. 
Again, try to reason through the problem using the basics you've already learned, rather than looking up slick search functions that will do the job for you. We'd rather see you write code that you actually understand!
*/

/* RELEASE 2 - GENERATE RANDOM TEST DATA
Write a function that takes an integer for length, and builds and returns an array of strings of the given length. 
So if we ran your function with an argument of 3, we would get an array of 3 random words back (the words don't have to be actual sensical English words -- "nnnnfph" totally counts). 
The words should be of randomly varying length, with a minimum of 1 letter and a maximum of 10 letters. (This involves a new trick, generating a random number, that you'll have to look up, but the solution on how to do so is relatively straightforward.)
Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.
*/
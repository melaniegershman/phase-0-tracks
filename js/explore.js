// ======= PSEUDOCODE REVERSE METHOD:
// - A method takes a string
// - Make a new empty string
// - For each character in the input string, take the last character in the string and add it to the new string

// ======= REVERSE METHOD:
function reverse(word) {
	var new_word = '';
	for (var i = word.length - 1; i >= 0; i--)
		new_word += word[i];
	return new_word;
}

// ======= DRIVER CODE:
console.log(reverse("blah"));

// ======= CONDITIONAL:
var greeting = true;
var parting = false;

if (greeting) {
	console.log(reverse("hello"));
} else if (parting) {
	console.log(reverse("goodbye");
} else {
	console.log("whatever");
}

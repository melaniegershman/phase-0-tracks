var colors = ["black", "blue", "green", "purple"];
var names = ["Jose", "Maria", "Eduardo", "Rachel"];


colors.push("pink")
names.push("Carlos")
// DRIVER CODE
// console.log(colors)
// console.log(names)

// Use arrays to create an object
// The keys should be horse names
// Values should be colors


if (colors.length == names.length) {
	//INSERT LOOP HERE
	var horse = {};
	for (i = 0; i < colors.length; i++) {
		horse[names[i]] = colors[i]
	}
	for(name in horse) {
    console.log (name + ":", horse[name]);
	}
} else {
	console.log("You don't have enough values to create an object!")
}

function Car(color, brand, max_speed) {
	this.color = color;
	this.brand = brand;
	this.max_speed = max_speed;
	this.engine_on = false;

	this.turn_on = function() {
		engine_on = true;
		console.log("Engine is on! Beep!")
	};
	this.turn_off = function() {
		engine_on = false;
		console.log("Engine is off!")
	}
}

var car = new Car("green", "Toyota Prius", 100);
car.turn_on();
car.turn_off();
// Driver code to confirm instance variables were created
console.log(car.color);
console.log(car.brand);
console.log(car.max_speed);
var ferrari = new Car("neon yellow", "Ferrari", 180);
ferrari.turn_on();
ferrari.turn_off();
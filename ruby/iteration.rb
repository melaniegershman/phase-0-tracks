#RELEASE 0

def greeting
	name1 = "Melanie"
	name2 = "Tim"
	puts "Hello!"
	yield(name1, name2)
	puts "Now they're done with release 0. Onward & upward!"
end

greeting {|name1, name2| puts "#{name1} and #{name2} paired together on this assignment."}

#RELEASE 1
colors = ["blue", "yellow", "red"]
objects = {
	blue: "bird",
	yellow: "banana",
	red: "apple"
}

# iterate through the array with .each
puts "Original data:"
p colors
puts "After .each call:"
colors.each {|color| puts color}
p colors

# iterate through the array with .map!
puts "Original data:"
p colors
puts "After .map! call:"
colors.map! {|color| p "#{color.capitalize} is a primary color!"}
p colors

# iterate through the hash with .each
puts "Original data:"
p objects
puts "After .each call:"
objects.each do |key, value| 
	p "A #{value} is #{key}."
end
p objects

#RELEASE 2
arr = [1, 2, 3, 4, 5, 6]
hash = {
	a: 100, 
	b: 200,
	c: 300	
}

# A method that iterates through the items, deleting any that meet a 
# certain condition (for example, deleting any numbers that are less 
# than 5).

arr.delete_if{|x| x < 3 }
hash.delete_if{|key, value| value < 200}

# A method that filters a data structure for only items that do satisfy 
# a certain condition (for example, keeping any numbers that are less 
# than 5).

arr.keep_if {|x| x.even?}
hash.keep_if {|key, value| value < 200 }

# A different method that filters a data structure for only items 
# satisfying a certain condition.

arr.select {|x| x.even?}
hash.select {|key, value| value < 200 }

arr.reject {|x| x.even?}
hash.reject {|key, value| value < 300 }

# A method that will remove items from a data structure until the 
# condition in the block evaluates to false, then stops.
arr = [1, 3, 5, 4, 2, 6]
arr.take_while {|x| x.odd?}

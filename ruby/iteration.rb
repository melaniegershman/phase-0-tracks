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
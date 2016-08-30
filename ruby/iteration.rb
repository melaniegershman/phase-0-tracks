def greeting
	name1 = "Melanie"
	name2 = "Tim"
	puts "Hello!"
	yield(name1, name2)
	puts "Now they're done with release 0. Onward & upward!"
end

greeting {|name1, name2| puts "#{name1} and #{name2} paired together on this assignment."}
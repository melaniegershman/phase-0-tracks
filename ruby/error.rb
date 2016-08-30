# Theory:
# The error message provided when you try running this program is: undefined 
# local variable or method `stuff'. If 'stuff' is a method that you are calling 
# after lines 6 & 7, it needs to be defined first. Alternatively, if you are just 
# trying to run 'puts "stuff"', you just need to add quotation marks around "stuff".
def stuff
	puts "This is a program!"
	puts "It has a bug in it!"
end
puts stuff
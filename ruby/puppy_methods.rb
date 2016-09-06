class Puppy
  def initialize
  	puts "Initializing new puppy instance ..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(x)
  	x.times do 
  		puts "Woof!"
  	end
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(y)
  	new_age = y * 7
  	new_age
  end

  def dig(toy)
  	backyard_hole = []
  	backyard_hole << toy
  	backyard_hole
  end
end

fido = Puppy.new

fido.fetch("ball")
fido.speak(3)
fido.roll_over
fido.dog_years(2)
fido.dig("bone")

class Dance
	def initialize
		puts "Initializing new dance instance ..."
	end

	def pirouette(num)
		num.times do
			puts "*spins*"
		end
	end

	def leap(height)
		leap_length = height * 5
		# puts "The dancer leapt #{leap_length} feet!"
	end

end

ballerina = Dance.new
ballerina.leap(3)
ballerina.pirouette(2)

ballerinas = []
for i in (1..50) do
	ballerina = Dance.new
	ballerinas.push(ballerina)
	# ballerinas.each.with_index { |val,index| puts "index: #{index} for #{val}"}
end

ballerinas.each do |dancer|  
	dancer.pirouette(1)
	dancer.leap(2)
	# Separates each dancer's actions:
	# puts "-" * 10
	end
# ballerinas[3]
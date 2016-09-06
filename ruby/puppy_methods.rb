class Puppy
  def initialie
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
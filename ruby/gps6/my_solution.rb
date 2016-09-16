# Virus Predictor

# I worked on this challenge Allain Dollete.
# We spent 3 hours on this challenge.

# EXPLANATION OF require_relative
=begin
Require relative is used for code that you write, require will be used for code that someone else wrote. Require relative - you're providing a path to the file relative to its place in the directory. Require will load a library for reference in your own code. 
=end
require_relative 'state_data'

class VirusPredictor
  # Instantiates an object with the values of population, pop density, and state-of-origin
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  # Calls predicted_deaths and speed_of_spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

# ===== REFACTORED METHODS
   def predicted_deaths
    inf = 1.0/0.0
     case @population_density
       when 200..inf then number_of_deaths = (@population * 0.4).floor
       when 150..199 then number_of_deaths = (@population * 0.3).floor
       when 100..149 then number_of_deaths = (@population * 0.2).floor
       when 50..99 then number_of_deaths = (@population * 0.1).floor
       else number_of_deaths = (@population * 0.05).floor
     end
     print "#{@state} will lose #{number_of_deaths} people in this outbreak"
   end

  # Takes in pop density and state and returns the speed of spread over a period of months
  
  def speed_of_spread #in months
    inf = 1.0/0.0
    speed = 0.0
    case @population_density
     when 200..inf then speed += 0.5
     when 150..199 then speed += 1
     when 100..149 then speed += 1.5
     when 50..99 then speed += 2
     else speed += 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
# Refactored the former driver code to iterate through all items in the STATE_DATA hash
  STATE_DATA.each do|state, data|
    each_state = VirusPredictor.new(state, data[:population_density], data[:population])
    each_state.virus_effects
  end
#=======================================================================
# Reflection Section
=begin
What are the differences between the two different hash syntaxes shown in the state_data file?
One hash uses the rocket operator, and the other places a colon at the end of the key rather than at the beginning. Also, the hash in which the key is a state uses a string as a key, but the hash within that uses a symbol as a key. 

What does require_relative do? How is it different from require?
Require relative is used for code that you write; require will be used for code that someone else wrote. Require relative means you're providing a path to the file relative to it's place in the directory. Require will load a library for reference in your own code. 

What are some ways to iterate through a hash?
You can iterate through a hash using a loop, or an enumerable

When refactoring virus_effects, what stood out to you about the variables, if anything?
I noticed that calling instance variables in as parameters was redundant. Given their scope, we could access them without having to pass them in as arguments. 

What concept did you most solidify in this challenge? 
I think I finally got the hang of using case statements. I've previously had trouble with their syntax and this was a great way to dive deeper into understanding how to write them. 
=end
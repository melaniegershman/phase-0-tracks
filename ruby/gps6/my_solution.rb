# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

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

  # Takes pop density, pop, and state as arguments and returns number_of_deaths based on pop density.
  # def predicted_deaths
  #   # predicted deaths is solely based on population density
  #   if @population_density >= 200
  #     number_of_deaths = (@population * 0.4).floor
  #   elsif @population_density >= 150
  #     number_of_deaths = (@population * 0.3).floor
  #   elsif @population_density >= 100
  #     number_of_deaths = (@population * 0.2).floor
  #   elsif @population_density >= 50
  #     number_of_deaths = (@population * 0.1).floor
  #   else
  #     number_of_deaths = (@population * 0.05).floor
  #   end

  #   print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  # end

  def predicted_deaths
    case @population_density
      when @population_density >= 200
        number_of_deaths = (@population * 0.4).floor
      when @population_density >= 150
        number_of_deaths = (@population * 0.3).floor
      when @population_density >= 100
        number_of_deaths = (@population * 0.2).floor
      when @population_density >= 50
        number_of_deaths = (@population * 0.1).floor
      else 
        number_of_deaths = (@population * 0.05).floor
    end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  # Takes in pop density and state and returns the speed of spread over a period of months
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

  STATE_DATA.each do|state, data|
    each_state = VirusPredictor.new(state, data[:population_density], data[:population])
    each_state.virus_effects
  end

# Refactored the former driver code to iterate through all items in the STATE_DATA hash
#=======================================================================
# Reflection Section
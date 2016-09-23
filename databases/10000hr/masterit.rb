def update(update_goal)
	log = {}
	puts "What did you do today to help you master #{update_goal}?"
	activity = gets.chomp.capitalize
	puts "How many hours did you spend on: \n - '#{activity}'?"
	hours = gets.chomp.to_i
	log[activity] = hours
	log
end

def new_goal
end

def add_hours
end

def print_log(log)
	# the below '10k - hours' should really be '10k - [sum of all HOURS in your table'
	log.each {|activity, hours| puts "You are #{10000 - hours} hours away from completing your goal! "}
end

# =========== User Interface

def master_it
	puts "Hello! \n Malcolm Gladwell once wrote that it takes 10,000 hours to master a skill. I'm here to help you keep track! \n Type 'update' if you'd like to log hours to a previous a skill in progress, and type 'new' if you'd like to begin logging a new skill."
	new_or_update = gets.chomp.downcase
	if new_or_update == "new"
		puts "Making a new goal!"
		log = new_goal
	elsif new_or_update == "update"
		puts "What would you like to update?"
		# PLACEHOLDER: access database and print names of tables in list format
		update_goal = gets.chomp.downcase
		# PLACEHOLDER: at this point your database needs to open? or you need to access your data table based on the input
		log = update(update_goal)
	else 
		puts "What are you waiting for? You've got a skill to improve!"
	end
	print_log(log)
	puts "Thanks for using MasterIt. See you next time!"
end

master_it
def update
end

def new_goal
end

# =========== User Interface

def master_it
	puts "Hello! \n Malcolm Gladwell once wrote that it takes 10,000 hours to master a skill. I'm here to help you keep track! \n Type 'update' if you'd like to log hours to a previous a skill in progress, and type 'new' if you'd like to begin logging a new skill."
	new_or_update = gets.chomp.downcase
	if new_or_update == "new"
		puts "Making a new goal!"
		new_goal
	elsif new_or_update == "update"
		puts "What would you like to update?"
		update
	else 
		puts "What are you waiting for? You've got a skill to improve!"
	end
	puts "Thanks for using MasterIt. See you next time!"
end

master_it
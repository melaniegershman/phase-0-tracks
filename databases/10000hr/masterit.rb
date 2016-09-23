require 'sqlite3'

db = SQLite3::Database.new("10000hr.db")

create_activity_table = <<-SQL
	CREATE TABLE IF NOT EXISTS activity_log(
    	id INTEGER PRIMARY KEY,
    	activity VARCHAR(255),
    	hours INTEGER,
    	skill_id INTEGER
    );
SQL

create_skills_table = <<-SQL
    CREATE TABLE IF NOT EXISTS skills(
    	id INTEGER PRIMARY KEY,
    	name VARCHAR(255)
    );
SQL

db.execute(create_activity_table)
db.execute(create_skills_table)

def new_skill(db)
	puts "What is the skill you would like to master?"
	skill_name = gets.chomp.downcase
	db.execute("INSERT INTO skills (name) VALUES (?)", [skill_name])
	puts "Have you done anything today to master your skill? (yes/no)"
		input = gets.chomp.downcase
		if input == "yes"
			puts "What did you do today to help you master #{skill_name}?"
			update_goal = gets.chomp.downcase
			update(update_goal)
		else
			puts "Thanks for adding your new skill. Get to work!"
		end
	skill_list = db.execute("SELECT * FROM skills")
	puts skill_list
end

def update(update_goal, db)
	puts "What did you do today to help you master #{update_goal}?"
	activity = gets.chomp.capitalize
	puts "How many hours did you spend on: \n - '#{activity}'?"
	hours = gets.chomp.to_i
	# this skill_id variable should give me an ID derived from the user input of a skill name, which is then used to interpolate user's input and add it to the activity log table:
	skill_id = db.execute("SELECT skills.name FROM skills WHERE skills.id = activity_log.skill_id")
	# log = {}
	puts skill_id
	db.execute("INSERT INTO activity_log (activity, hours, skill_id) VALUES (?, ?, ?)"[activity, hours, skill_id])
	# log[activity] = hours
	# the log variable should return a table that displays the activities performed and hours commited to the skill the user is currently updating:
	log = db.execute("SELECT activity_log.activity, activity_log.hours WHERE activity_log.skill_id = skills.id")
end

def add_hours(db)
end

# def print_log(log, db)
# 	# the below '10k - hours' should really be '10k - [sum of all HOURS in your table'
# 	log.each {|activity, hours| puts "You are #{10000 - hours} hours away from completing your goal! "}
# end

# =========== User Interface

def master_it(db)
	puts "Hello! \n Malcolm Gladwell once wrote that it takes 10,000 hours to master a skill. I'm here to help you keep track! \n Type 'update' if you'd like to log hours to a previous a skill in progress, and type 'new' if you'd like to begin logging a new skill."
	new_or_update = gets.chomp.downcase
	if new_or_update == "new"
		puts "Great!"
		log = new_skill(db)
	elsif new_or_update == "update"
		puts "What would you like to update?"
		db.execute("SELECT * FROM skills")
		# PLACEHOLDER: access database and print names of tables in list format
		update_goal = gets.chomp.downcase
		# PLACEHOLDER: at this point your database needs to open? or you need to access your data table based on the input
		log = update(update_goal, db)
	else 
		puts "What are you waiting for? You've got a skill to improve!"
		# NOTE! error message pops up bc this doesn't return anything to the following 'print_log' method. this should return a 'log' consisting of all the skills in progress!
	end
	# print_log(log, db)
	puts "Thanks for using MasterIt. See you next time!"
end

master_it(db)
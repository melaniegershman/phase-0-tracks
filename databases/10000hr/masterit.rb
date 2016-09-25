require 'sqlite3'

db = SQLite3::Database.new("10000hr.db")

create_activity_table = <<-SQL
  CREATE TABLE IF NOT EXISTS activity_log(
      id INTEGER PRIMARY KEY,
      activity VARCHAR(255),
      hours INTEGER,
      skill_id INTEGER,
      FOREIGN KEY (skill_id) REFERENCES skills(id)
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

def update_skill(db, skill)
  puts "What is the skill you would like to master?"
  skill_name = gets.chomp.downcase
  db.execute("INSERT INTO skills (name) VALUES (?)", skill_name)

  p update(skill_name, db)
end

def update(skill_name, db)
  # skill = db.execute("SELECT name FROM skills WHERE id=(?)", skill_name)
  # puts "What did you do today to help you master #{skill[0]}?"
  puts "What did you do today to help you master #{skill_name}?"
  activity = gets.chomp.capitalize
  puts "How many hours did you spend on: \n'#{activity}'?"
  hours = gets.chomp.to_f
  # this skill_id variable should give me an ID derived from the user input of a skill name, which is then used to interpolate user's input and add it to the activity log table:
  skill_id = db.execute("SELECT id FROM skills WHERE name=(?)", skill_name)
  db.execute("INSERT INTO activity_log (activity,hours,skill_id) VALUES (?, ?, ?)", activity, hours, skill_id)
  # the log variable should return a table that displays the activities performed and hours commited to the skill the user is currently updating:
  db.execute("SELECT activity, hours FROM activity_log WHERE skill_id =(?)", skill_id)
end

def time_remaining(skill_name, db)
# the below '10k - hours' should really be '10k - [sum of all HOURS in your table'
  skill = db.execute("SELECT name FROM skills WHERE id=(?)", skill_name)
  hours = db.execute("SELECT hours FROM activity_log WHERE skill_id =(?)", skill_name)
  hours = hours.flatten
  hours_sum = hours.reduce(:+)
  time_remaining = 10000 - hours_sum
  percent_left = (hours_sum/10000) * 100
  puts "You have completed #{percent_left} % of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill[0][0]}."
end

def print_activity_log(log, db)
  puts "You have taken the following steps toward mastering this skill:"
  log.each {|activity| puts "- #{activity[0]}: #{activity[1].to_f} hours "}
end

def print_skills(db)
	skill_list = db.execute("SELECT * FROM skills")
	skill_list.each {|skill| puts "#{skill[0]}. #{skill[1].capitalize}"}
end

# =========== User Interface

def master_it(db)
  puts "Hello! \nMalcolm Gladwell once wrote that it takes 10,000 hours to master a skill. I'm here to help you keep track! \nType 'update' if you'd like to log hours to a previous a skill in progress, and type 'new' if you'd like to begin logging a new skill."
  new_or_update = gets.chomp.downcase
  
  if new_or_update == "new"
    puts "Great!"
    log = new_skill(db)
    print_log(log, db)
    time_remaining(skill_name, db)
  elsif new_or_update == "update"
    puts "Please select the number of the skill you would like to update:"
    print_skills(db)
    skill_name = gets.chomp.downcase
    log = update(skill_name, db)
    print_log(log, db)
    time_remaining(skill_name, db)
  else 
    puts "What are you waiting for? You've got a skill to improve!"
  end
  puts "Thanks for using MasterIt. See you next time!"
end

master_it(db)

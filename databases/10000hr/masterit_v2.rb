require 'sqlite3'

# =========== Database Setup
db = SQLite3::Database.new("10000hr.db")

create_activity_table = <<-SQL
  CREATE TABLE IF NOT EXISTS activity_log(
      id INTEGER PRIMARY KEY,
      activity VARCHAR(255),
      hours INTEGER,
      day INTEGER,
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

db.execute(create_skills_table)
db.execute(create_activity_table)

# =========== Helper Methods
# ----------- Convert skill id to name; skill name to id
def skill_id_to_name(db, skill_id)
  skill_name = db.execute("SELECT name FROM skills WHERE id=(?)", skill_id)
  if skill_name.length > 0
    skill_name[0][0]
  end
end

def skill_name_to_id(db, skill_name)
  db.execute("SELECT id FROM skills WHERE name=(?)", skill_name)
end
# ----------- Update activity log and skill tables
def skill_handler(db, skill)
# ----------- Skill is passed in as an array in UI and updated per these variables:
  skill_name = skill[0]
  activity_name = skill[1]
  hours = skill[2]
  day = skill[3]
  all_skills = db.execute("SELECT name FROM skills").flatten
# ----------- Create new skill if not in db
  if !all_skills.include?(skill_name)
    db.execute("INSERT INTO skills (name) VALUES (?)", skill_name)
  end
  skill_id = skill_name_to_id(db, skill_name)
# ----------- Create activity
  db.execute("INSERT INTO activity_log (activity, hours, skill_id, day) VALUES (?, ?, ?, ?)", activity_name, hours, skill_id, day)
  db.execute("SELECT activity, hours, day FROM activity_log WHERE skill_id =(?)", skill_id)
end

def time_remaining(skill_name, db)
  skill_id = skill_name_to_id(db, skill_name)
  hours = db.execute("SELECT hours FROM activity_log WHERE skill_id =(?)", skill_id).flatten
  hours_sum = hours.reduce(:+).to_f
  time_remaining = 10000 - hours_sum
  percent_completed = ((hours_sum/10000) * 100).round(2)

  flag = 0

  if flag == 0
    if percent_completed > 100
      puts "Wow, you're going above and beyond! You have completed #{hours_sum} hours in #{skill_name}."
    elsif percent_completed == 100
      puts "You did it! You're a master of #{skill_name}!"
      flag = 1
    elsif percent_completed >= 50
      puts "Wow, you're over halfway there! You have completed #{percent_completed}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
      flag = 1
    elsif percent_completed >= 25
      puts "Great job, you have completed #{percent_completed}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
      flag = 1
    elsif percent_completed >= 1
      puts "Nice work, you have completed #{percent_completed}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
      flag = 1
    elsif percent_completed < 1
      puts "You're still a rookie, but keep up the good work! You have #{time_remaining.to_f} hours left until you have mastered #{skill_name}." 
    end 
  end
end

def print_activity_log(log, db)
  system "clear"
  puts "You have taken the following steps toward mastering this skill:\n\n"
  puts "DATE | ACTIVITY COMPLETED | TIME SPENT"
  log.each {|activity| puts "#{activity[2]} |x| #{activity[0]}: #{activity[1].to_f} hours"}
end

def print_skills(db)
  skill_list = db.execute("SELECT * FROM skills")
  activity_list = db.execute ("SELECT skills.name, activity_log.hours FROM activity_log JOIN skills ON activity_log.skill_id = skills.id")

  skill_list.each do |skill|
    skill_name = skill[1]
    skill_id = skill[0]
    total_hours = 0
    activity_list.each do |activity|
      if skill_name == activity[0]
        total_hours += activity[1]
      end
    end
    puts "#{skill_id}. #{skill_name.capitalize} | Total hours: #{total_hours}"
  end
end

# =========== User Interface
system "clear"
puts "Hello! \nMalcolm Gladwell once wrote that it takes 10,000 hours to master a skill. MasterIt is here to help you keep track! \n\nHit ENTER to start."
user_input = gets.chomp
until user_input == "no"
  puts "Select a skill from the below list, or enter a new skill you have improved:"
  print_skills(db)
  skill = []
  skill_input = gets.chomp

  # check whether input was skill id or skill name
  skill[0] = skill_id_to_name(db, skill_input.to_i)
  skill[0] = skill_input if skill[0] == nil

  puts "Please enter today's date in the following format: mm-dd-yyyy:"
  skill[3] = gets.chomp
    until skill[3].length == 10
      puts "Please enter today's date in the correct format: mm-dd-yyyy:"
      skill[3] = gets.chomp
    end
  puts "What did you do to improve #{skill[0]}?"
  skill[1] = gets.chomp
  puts "How many HOURS did you spend on '#{skill[1]}'? (Decimals are okay!)"
  skill[2] = gets.chomp
    if !skill[2].include?("1234567890")
      puts "Please enter a valid number."
      skill[2] = gets.chomp
    end
  activity_log = skill_handler(db, skill)
  print_activity_log(activity_log, db)
  time_remaining(skill[0], db)
  puts "Would you like to enter additional progress? Type yes or no."
  user_input = gets.chomp.downcase
end
puts "Thanks for using MasterIt. Keep working hard!"
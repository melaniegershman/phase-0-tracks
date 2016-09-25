require 'sqlite3'

# =========== Database Setup
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

def time_remaining(skill_name, db)
  skill_id = skill_name_to_id(db, skill_name)
  hours = db.execute("SELECT hours FROM activity_log WHERE skill_id =(?)", skill_id).flatten
  hours_sum = hours.reduce(:+)
  time_remaining = 10000 - hours_sum
  percent_left = (hours_sum/10000) * 100
  if percent_left == 100
    puts "You did it! You're a master of #{skill_name}!"
  elsif percent_left >= 50 && percent_left < 100
    puts "Wow, you're over halfway there! You have completed #{percent_left}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
  elsif percent_left >= 25 && percent_left < 50
    puts "Nice work, you have completed #{percent_left}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
  elsif percent_left >= 1 && percent_left < 25
    puts "Nice work, you have completed #{percent_left}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
  elsif percent_left < 1
    puts "You're still a rookie, but keep up the good work! You have #{time_remaining.to_f} hours left until you have mastered #{skill_name}." 
  end 
end

def print_activity_log(log, db)
  puts "You have taken the following steps toward mastering this skill:"
  log.each {|activity| puts "- #{activity[0]}: #{activity[1].to_f} hours "}
end

def print_skills(db)
  skill_list = db.execute("SELECT * FROM skills")
  skill_list.each {|skill| puts "#{skill[0]}. #{skill[1].capitalize}"}
end
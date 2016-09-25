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
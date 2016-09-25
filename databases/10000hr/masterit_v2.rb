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
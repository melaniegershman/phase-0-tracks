require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("10000hr.db")
db.results_as_hash = true

get '/' do
	@skills = db.execute("SELECT * FROM skills")
	p @skills
	erb :home
end

post '/activity_log' do
  skill_name = params['skill']
  activity_name = params['activity']
  hours = params['hours']
  day = params['date']
  @skills = db.execute("SELECT * FROM skills")
# ----------- Create new skill if not in db
  if !@skills.include?(skill_name)
    db.execute("INSERT INTO skills (name) VALUES (?)", skill_name)
  end
  # skill_id = skill_name_to_id(db, skill_name)
# ----------- Create activity
  db.execute("INSERT INTO activity_log (activity, hours, skill_name, day) VALUES (?, ?, ?, ?)", activity_name, hours, skill_name, day)
  db.execute("SELECT activity, hours, day FROM activity_log WHERE skill_name =(?)", params['skill'])
	erb :activity_log
end
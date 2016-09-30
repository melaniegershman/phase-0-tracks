# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @new_students = db.execute("SELECT * FROM new_students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  @campuses = db.execute("SELECT * FROM campuses")
  p @campuses
  flag = false
  campus_id = nil
  @campuses.each do |campus|
  	if campus['name'] == params['campus']
  		flag = true
  		campus_id = campus['id']
  	end
  end
  p flag
  p campus

  if flag
	db.execute("INSERT INTO new_students (name, campus_id, age) VALUES (?,?,?)", [params['name'], campus_id, params['age'].to_i])  	
  else
	db.execute("INSERT INTO campuses (name) VALUES (?)", [params['campus']])  
	campus_id = db.execute("SELECT id FROM campuses WHERE name= (?)", params['campus'])
	p campus_id
	db.execute("INSERT INTO new_students (name, campus_id, age) VALUES (?,?,?)", [params['name'], campus_id, params['age'].to_i])  	
	end	
  
  redirect '/'
end

# add static resources
# access campuses, Release 1
# get '/campuses' do
# 	@campuses = db.execute("SELECT DISTINCT campus_id FROM new_students")
# 	p @campuses
# 	erb :campuses
# end

#access campuses, release 2
get '/campuses' do
	@campuses = db.execute("SELECT name FROM campuses")
	p @campuses
	erb :campuses
end

# Release 2:
# Rather than adding a new form to add a new campus, we built in logic to add a new campus if needed when a new student is entered. There can't be a new campus without students! :)

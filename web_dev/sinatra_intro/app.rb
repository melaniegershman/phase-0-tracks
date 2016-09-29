# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
=begin
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end
=end
# write a GET route with
# route parameters
=begin
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end
=end

# write a GET route that retrieves
# all student data
=begin
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end
=end

# write a GET route that retrieves
# a particular student
=begin
get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end
=end

# ========= Release 0: Add Routes
# 1. A /contact route that displays an address.
get '/contact/:person/:contact' do
    person = params[:person]
    contact = params[:contact]
    "#{person} lives at #{contact}."
end
# 2. A /great_job route that can take a person's name as a query param.


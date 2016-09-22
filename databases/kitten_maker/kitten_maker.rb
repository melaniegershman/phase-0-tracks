# OPERATION KITTEN EXPLOSION!

# talk about Object Relational Mapping (ORM)
=begin
- How do we take the relational data we've been working with and use it in an object oriented language.
- We want to use the data as hashes or arrays
- When we require our gems (a gem is pre-written ruby that another programmer wrote. You 'require' it when you write your program. Ex: rspec, SQLite for)	
=end
# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("kittens.db")
db.results_as_hash = true

# learn about fancy string delimiters
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS kittens(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    age INT
  )
SQL

# create a kittens table (if it's not there already)
db.execute(create_table_cmd)

# add a test kitten
# db.execute("INSERT INTO kittens (name, age) VALUES ('Bob', 10)")

# add LOOOOTS of kittens!
# so. many. kittens. 
#KittenExplosion
def create_kitten(db, name, age)
  db.execute("INSERT INTO kittens (name, age) VALUES (?, ?)", [name, age])
end

1.times do
  create_kitten(db, Faker::Name.name, 0)
end

# explore ORM by retrieving data
kittens = db.execute("SELECT * FROM kittens")
kittens.each do |kitten|
 puts "#{kitten['id']}. #{kitten['name']} is #{kitten['age']} months old."
end


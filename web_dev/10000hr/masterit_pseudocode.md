Gladwellinator Plan

What it does: logs progress until you've reached 10,000 hours

- program greets you
- program gives you list of skills
- tells you how to log time
- app figures out if what you've entered is a new skill or not
- user should be able to :
	- update app
	- add new skill
	- view current list of skills in progress
- write a method that converts skill name to skill id
- write a method that converts skill id to skill name

Interface:
- Greet user [done!]
- Ask user if they want to make a new goal, or if they would like to update a goal in progress [done!]
	- If new skill: 
		- Ask what the skill is
		- Run "new skill" protocol (METHOD)
	- If update skill:
		- Print/display list of ongoing skills (METHOD)
		- Ask user which skill they want to update
		- Store response
		- Run "update skill" protocol (METHOD) by passing in response
	OTHERWISE:
		- print "What are you waiting for, get to work!"
- Print "Thanks for logging your goals on the Gladwellinator!"	
		

UPDATE SKILL METHOD: [done!]

- Ask what they have done to make progress on their goal
	- Store activity
- Ask how many hours they have committed to their progress (float)
	- Store hours
- Return current activity log with both activity and hours
- Return how many hours out of 10,000 you've completed so far
	steps: extract hours from log, store into array, and use reduce(:+) to calculate total

NEW SKILL METHOD: [done!]

- Ask user for name of skill
- Add new entry to skills table
- Store data relevant to name of skill as Hash
- Return empty data table
- Ask user if they have done anything to improve their skill
	- If input == "yes"
		- Run "update skill"
	- If input == "no"
		- Print "Thanks for adding a new skill!"

  def print_time_remaining(percent_left)
    case percent_left
    when 100 then "Congratulations! You have completed #{percent_left}\% of your skill. You're a master!"
    when 50..99 then "You are over halfway there! Keep it up! You have completed #{percent_left} % of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
    when 25..99 then "You're almost there! You have completed #{percent_left}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
    when 15..24 then "Awesome progress! You have completed #{percent_left}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
    when 1..14 then "Solid start! You have completed #{percent_left}\% of your skill, and you have #{time_remaining.to_f} hours left until you have mastered #{skill_name}."
  end
end
=begin
- Store items on initialization
input: n/a, list exists when you create an instance
steps: 
output: returns a list of things to do
- Add item to list
input:
steps:
output:
- Delete item
input:
steps:
output:
- Retrieve item by index
input:
steps:
output:
=end

class TodoList
	def initialize(list)
		@list = list
	end

	def get_items
		@list
	end

	def add_item(item)
		@list << item
	end

	def delete_item(item)
		@list.delete(item)
	end

	def get_item(index)
		@list[index]
	end
end

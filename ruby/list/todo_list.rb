=begin
- Store items on initialization
input: n/a, list exists when you create an instance
steps: return list
output: returns a list of things to do
- Add item to list
input: an item to do
steps: add item to the end of your to-do list
output: return updated todo list
- Delete item
input: an item to delete
steps: remove in to-do list
output: return updated to-do list
- Retrieve item by index
input: an integer
steps: find an item on the list by its index
output: one item
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

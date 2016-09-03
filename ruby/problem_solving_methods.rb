=begin
Paired with Derrick Carr
Pseudocode
Release 0: Find an Index
Take an array and an integer. Search array for integer. Return index of that integer. Don't use built-in array methods.

Take an array, an integer
  Search array for a number that matches the integer
  If number doesn't match, keep searching
  Return the index of the matching number
Stop

Method takes array and integer as input
Loop through the array, comparing each number to integer search how
  - If it matches, return index at that point in array
  - Otherwise return nil.
=end

def search_arr(array, n)
  idx = 0
  while idx < array.length
    puts "Index is #{idx} and value is #{array[idx]}"
    return idx if array[idx] == n
    idx += 1
  end
end
# Each broke for us. Need to research how to use it.

=begin
Release 1: Calculate Fibonacci Numbers

Method takes an integer as input
  Create a new array that contains the values 0 and 1 (possible array inside method = [0,1])
  Until array length is equal to integer given
  - Add last and second-to-last number in array together
  - Push result to array within method
  Return the array of sums
=end

def fibonacci(num)
  fib_arr = [0, 1]
  if num == 0 || num == 1
    return fib_arr[num]
  else
    i = 2
    until fib_arr.length == num
      sum = fib_arr[-2] + fib_arr[-1]
      fib_arr.push(sum)
      i += 1
    end
  end
  fib_arr
end

fibonacci(100).last == 218922995834555169026

=begin
Release 2: Implement a Sorting Method
Pseudocode: Shell Sort

Consider an array
Determine the step gaps (g) (based on weblink)
Loop through the array while g > 0
  - Create subarrays that contains an number at index and index+g numbers
  - Sort each subarray least to greatest
  - Reinsert each subarray into main array with its values sorted (combine into one array)
  - Continue creating subarrays until end of main array
  - Change g to g/2 rounded down to the nearest whole number
  - Repeat above steps with new g value
Return the combined array
=end

array =[9, 6, 12, 2,  7, 5, 1]

def shell_sort(array)
<<<<<<< Updated upstream
  p array
  gap = array.length/2
  while gap > 0
    puts "gap is currently #{gap}"
=======
  # p array
  gap = array.length/2
  while gap > 0
>>>>>>> Stashed changes
    idx = 0
    while idx < array.length - gap
      # while loop to move multiple steps
      while array[idx + gap] < array[idx]
        array[idx+gap],array[idx] = array[idx],array[idx+gap]
        if idx > 0
<<<<<<< Updated upstream
          idx -= 1
=======
          idx -= 1 
>>>>>>> Stashed changes
        else
          break
        end
      end
      idx += 1
    end
    gap = gap/2
<<<<<<< Updated upstream
=======
    # puts "new gap is #{gap}"
>>>>>>> Stashed changes
    p "-" * 10
   p array
  end
end

<<<<<<< Updated upstream
shell_sort(array)

=======
>>>>>>> Stashed changes
=begin
Release 2: Bubble Sort Implementation
- determine the length of the array and the amount of passes you will need to sort it. if array length is 'n', you will need to pass through the array 'n-1' times.
- A pass is the movement of a number across the entire array. The nth pass begins when you start at index 0 again. Until length is 0 (no more items to check), continue passing through the array.
- Loop through the array and compare numbers one at a time to determine which has a higher value
- If the numbers are out of order, swap them
- The largest values will bubble up to the right of the array, and will no longer need to be tested
- if a number is at the end of the array, do not test
- if a number is at the second-to-last place of the array at the beginning of the third pass, you do not need to test it
- As each number with the largest value is correctly placed, you will need to loop through one less time
- To optimize, keep track of whether numbers were swapped, and if any were swapped, then you know it wasn't the final loop. 
- When no numbers are swapped, your evaluation is done
=end
def ascend_bubble_sort(arr)
  len = arr.length
  until len == 0  
    i = 0
    swap_count = 0
    while i < arr.length - 1
      current_num = arr[i]
      next_num = arr[i +1]
      if current_num > next_num
        arr[i], arr[i +1] = arr[i +1], arr[i] #swap
        swap_count += 1
         #p swap_count #[debugger to check how many swaps are being made]
      end
      i += 1
    end
    if swap_count == 1
      break
    end
  len -= 1
  #p arr #[debugger to check how many times the array is being checked]
  end
  arr
end

p ascend_bubble_sort([6, 5, 4, 3, 2, 17, 14, 52])
# p ascend_bubble_sort([5, 4, 33, 2, 1, 6])
# p ascend_bubble_sort([4, 3, 21, 12, 35, 6])
# p ascend_bubble_sort([3, 2, 1, 4, 5, 6])

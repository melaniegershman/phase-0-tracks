=begin
Paired with Derrick Carr
Pseudocode

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

def shell_sort(num_arr)
  gap = num_arr.length/2 #automatically passed through .floor
  while gap > 0
    sub_index = 0
      while sub_index < num_arr.length
        sub_values = []
        sub_values << sub_index
        new_arr = []
        new_arr << num_arr[sub_index]
        sub_index += gap
      end
      #sort new_arr
      num_arr[]

    gap /= 2

  end
end

=begin
Manually typing out the algorithms efforts
[0,1,2,3,4,5,6,7,8,9,10,11] #initial
[0,4,8][1,5,9][2,6,10][3,7,11] #4 step
[8,4,0,9,5,1, 10,6,2,11,7,3] #recombined
[8, 9, 10, 11 ][4, 5, 6, 7][0, 1, 2, 3] #3 step
[11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0] #recombined

[0 ,2 ,5, 4, 9, 10, 11, 3, 7, 8, 6, 1]#initial
[0, 9, 7][2, 10, 8][5, 11, 6][4, 3, 1]# 4 step
[0, 7, 9, 2, 8, 10, 5, 6, 11, 1, 3, 4]#recombine-sort
[0,2,5,1][7,8,6,3][9,10,11,4] #3step
[0, 1, 2, 5, 3, 6, 7, 8, 4, 9, 10, 11] #r
[0, 2, 3, 7, 4, 10][1, 5, 6, 8, 9, 11]
%w{0 2 3 4 7 10 1 5 6 8 9 11}
%w{0 2}%w{2 3}%w{3 4} %w{7 10 } %w{1 5} %w{6 8}
=end
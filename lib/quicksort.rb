# frozen_string_literal: true

#
# Code orginally from https://dev.to/mwong068/quick-sort-in-ruby-2302
# All credit to the original author @mwong068, https://github.com/mwong068
#
# This is monkeypatching Array, so just use an array!
#
# arr.quick_sort 
# >> [1, 2, 3, 4, 5]
#
# @return Array in sorted order
class Array
  def quick_sort(from_index = 0, to_index = length - 1)
     if from_index < to_index
       pivot_index = partition_and_get_pivot_index(from_index, to_index)
       quick_sort(from_index, pivot_index - 1)
       quick_sort(pivot_index + 1, to_index)
     end
     return self
   end

   def partition_and_get_pivot_index(from_index, to_index)
     pivot_value = self[to_index]
     pointer_a_index = pointer_b_index = from_index

     while pointer_a_index < to_index
       if self[pointer_a_index] <= pivot_value
         swap_values(pointer_a_index, pointer_b_index)
         pointer_b_index += 1
       end
       pointer_a_index += 1
     end
     swap_values(pointer_b_index, to_index)
     return pointer_b_index
   end

   def swap_values(index_a, index_b)
     self[index_a], self[index_b] = self[index_b], self[index_a]
   end
end

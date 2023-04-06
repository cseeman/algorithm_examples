#
# Ruby RSelect example
# RSelect.find_order_smallest([3,6,7,8,9,4,5], 2)
# 4
class RSelect
  #
  # Takes an array and a value k as input.
  # Returns the kth smallest element in the array using the Select algorithm.
  #
  # ex. if you want to smallest number in the array, k =1 (i.e. 1st smallest),
  # then if you want 2nd, 3rd, 4th,... use k= 2 or 3 or 4...
  #
  def self.find_order_smallest(array, k)
    return nil if array.empty? || k > array.length

    pivot = array.sample
    less = []
    equal = []
    greater = []

    array.each do |element|
      if element < pivot
        less << element
      elsif element == pivot
        equal << element
      else
        greater << element
      end
    end

    if k <= less.length
      find_order_smallest(less, k)
    elsif k <= less.length + equal.length
      pivot
    else
      find_order_smallest(greater, k - less.length - equal.length)
    end
  end
end

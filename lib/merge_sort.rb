# frozen_string_literal: true

class MergeSort
  def self.sort(numbers)
    return numbers if numbers.length <= 1

    half = (numbers.length / 2).round

    left  = numbers.take(half)
    right = numbers.drop(half)

    sorted_left = sort(left)
    sorted_right = sort(right)

    merge(sorted_left, sorted_right)
  end

  def self.merge(left_array, right_array)
    return left_array if right_array.empty?
    return right_array if left_array.empty?

    smallest_number = if left_array.first <= right_array.first
                        left_array.shift
                      else
                        right_array.shift
                      end

    recursive = merge(left_array, right_array)

    [smallest_number].concat(recursive)
  end
end

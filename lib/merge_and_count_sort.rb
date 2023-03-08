require 'pry'
# frozen_string_literal: true
# I was trying to be more literal with my reading
# of Merge-and-CountSplitInv from page 70 of Algorithms Illuminated:
# the Basics, but more checking for nil was needed to work with the comparisons.
# We will just chaulk this up to attempts were made 🤷
# Pseudo code is 'for k:=1 to n do'
class MergeAndCountSort
  def self.do_it_from_book(sorted_array_c, sorted_array_d)
    i = 0
    j = 0
    split_inv = 0
    sorted_array_b = []
    n = sorted_array_c.length + sorted_array_d.length
    range = 0..n

    range.each do |_k|
      if !sorted_array_c[i].nil? && sorted_array_c[i] < sorted_array_d[j]
        sorted_array_b << sorted_array_c[i]
        i += 1
      elsif !sorted_array_d[j].nil?
        sorted_array_b << sorted_array_d[j]
        j += 1
        split_inv += split_inv + (n / 2 - i + 1)
      else
        break
      end
    end

    [sorted_array_b, split_inv]
  end
end

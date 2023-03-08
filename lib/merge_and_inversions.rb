require 'pry'
# frozen_string_literal: true

class MergeAndInversions
  def merge(array)
    return array, 0 if array.length == 1

    a = array.take(array.length / 2)
    b = array.drop(array.length / 2)
    a, ai = merge(a)
    b, bi = merge(b)
    c = []
    i = 0
    j = 0
    inversions = 0 + ai + bi

    while i < a.length && j < b.length
      if a[i] < b[j] || a[i] == b[j]
        c << a[i]
        i += 1
      else
        c << b[j]
        j += 1
        inversions += (a.length - i)
      end
    end

    c << a[i]
    c << b[j]

    [c.reject(&:nil?), inversions]
  end
end

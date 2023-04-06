# frozen_string_literal: true

#
# Select class implements a dselect algoritm using deterministic linear-time algorithm
# Instead of RSelect with it's random pivot point, it uses a median of medians way to find the pivot.
# So not random, but a pretty good median.
#
class Select
  def self.dselect(array, k)
    return array.sort[k - 1] if array.length <= 5

    groups = array.each_slice(5).to_a
    medians = groups.map { |g| g.sort[2] }
    # This is the knockout tournament for the pivot element
    # using the medians from the groups, it finds a good enough median.
    pivot = dselect(medians, medians.length / 2 + 1)

    left = []
    right = []

    array.each do |x|
      if x < pivot
        left << x
      elsif x > pivot
        right << x
      end
    end

    if k <= left.length
      dselect(left, k)
    else
      dselect(right, k - left.length)
    end
  end
end

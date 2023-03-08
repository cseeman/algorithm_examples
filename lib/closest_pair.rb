# frozen_string_literal: true
require 'benchmark'

# Original code was from https://rosettacode.org/wiki/Closest-pair_problem#Ruby
# Rosetta Code Closest Pair Problem in Ruby
# Updating to make it a bit more idiomatic ruby. 
class ClosestPair
  include Benchmark
  Point = Struct.new(:x, :y)

  def distance(p1, p2)
    Math.hypot(p1.x - p2.x, p1.y - p2.y)
  end

  def closest_bruteforce(points)
    min_distance = Float::MAX
    min_points = []
    points.combination(2) do |pi, pj|
      dist = distance(pi, pj)
      if dist < min_distance
        min_distance = dist
        min_points = [pi, pj]
      end
    end
    [min_distance, min_points]
  end

  def closest_recursive(points)
    return closest_bruteforce(points) if points.length <= 3

    xp = points.sort_by(&:x)
    mid = points.length / 2
    xm = xp[mid].x
    dl, pair_l = closest_recursive(xp[0, mid])
    dr, pair_r = closest_recursive(xp[mid..])
    d_min, d_pair = dl < dr ? [dl, pair_l] : [dr, pair_r]
    yp = xp.find_all { |p| (xm - p.x).abs < d_min }.sort_by(&:y)

    closest = d_min
    closest_pair = d_pair

    0.upto(yp.length - 2) do |i|
      (i + 1).upto(yp.length - 1) do |k|
        break if (yp[k].y - yp[i].y) >= d_min

        dist = distance(yp[i], yp[k])
        if dist < closest
          closest = dist
          closest_pair = [yp[i], yp[k]]
        end
      end
    end
    [closest, closest_pair]
  end

  def check_performance
    points = Array.new(100) { Point.new(rand, rand) }
    pp ans1 = closest_bruteforce(points)
    pp ans2 = closest_recursive(points)

    raise 'bogus!' if ans1[0] != ans2[0]

    puts "Starting Benchmark..."
    points = Array.new(10_000) { Point.new(rand, rand) }
    Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:   ", ">average: ") do |x|
      bruteforce = x.report('bruteforce') { closest_bruteforce(points); }
      recursive  = x.report('recursive ')  { closest_recursive(points); }
      [bruteforce + recursive, (bruteforce + recursive) / 2]
    end

    puts "...End of Benchmark."
  end
end

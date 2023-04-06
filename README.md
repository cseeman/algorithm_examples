# algorithm_examples
Working through Algorithms Illuminated Part 1: The Basics by Tim Roughgarden using Ruby

## Testing
Try irb, if that doesn't work, go for pry.

### Divide And Conquer Algorithms
I ran these just with irb. No spec, I know that wasn't good, but this is me attempting to learn the material.
`irb -r ./merge_and_count_sort.rb`
```
irb(main):001:0> MergeAndCountSort.do_it_from_book([1,2],[4,5])
=> [[1, 2, 4, 5], 3]
```

merge_and_inversions was me attempting to change thi [python](https://medium.com/@ssbothwell/counting-inversions-with-merge-sort-4d9910dc95f0) example and changing it to ruby
```
irb -r ./merge_and_inversions
irb(main):002:0> MergeAndInversions.new.merge([1,5,2,8])
=> [[1, 2, 5, 8], 1]
```
It actually stops working with larger arrays, and I am pretty sure it has to do with the way it is doing recursion. But I don't have time to full debug. So Ruby example but not a great one.

merge_sort.rb is just a Merge Sort example in Ruby. No counting of inversions.

```
irb -r ./merge_sort
irb(main):001:0> MergeSort.sort([1,5,2,8,6,3])
=> [1, 2, 3, 5, 6, 8]
```

```
➜ irb -r ./closest_pair.rb
irb(main):001:0> obj = ClosestPair.new
obj.check_performance
[0.0035199181139167804, [#<struct ClosestPair::Point x=0.8999101163908466, y=0.009114553435330297>, #<struct ClosestPair::Point x=0.899139845049878, y=0.005679949296574005>]]
[0.0035199181139167804, [#<struct ClosestPair::Point x=0.899139845049878, y=0.005679949296574005>, #<struct ClosestPair::Point x=0.8999101163908466, y=0.009114553435330297>]]
Starting Benchmark...
              user     system      total        real
bruteforce  9.346157   0.127179   9.473336 (  9.526308)
recursive   0.059381   0.001229   0.060610 (  0.060931)
>total:   9.405538   0.128408   9.533946 (  9.587239)
>avg:     4.702769   0.064204   4.766973 (  4.793619)
...End of Benchmark.
```
### Select Algorithm

#### RSelect Algorithm


The find_order_smallest method first checks if the array is empty or if k is greater than the length of the array. If either of these conditions is true, it returns nil.
The method then selects a random pivot element from the array using the sample method. It then partitions the array into three parts: elements less than the pivot, elements equal to the pivot, and elements greater than the pivot.
It then uses recursion to continue the Select algorithm on the appropriate partition of the array depending on the value of k. If k is less than or equal to the length of the less partition, the method is called recursively on the less partition with the same value of k. If k is less than or equal to the length of the less and equal partitions combined, the method returns the pivot value. Otherwise, the method is called recursively on the greater partition with the value of k adjusted to account for the elements in the less and equal partitions.

irb -r ./r_select.rb

```
> RSelect.find_order_smallest([4,3,2,5,7,9], 3)
> 4
```

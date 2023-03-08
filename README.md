# algorithm_examples
Working through Algorithms Illuminated Part 1: The Basics by Tim Roughgarden using Ruby

## Testing
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

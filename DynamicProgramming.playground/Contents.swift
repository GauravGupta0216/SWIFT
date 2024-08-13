import Foundation

//Knapsack Tests
var weight: [Int] = [1, 3, 4, 5]
var value: [Int] = [1, 4, 5, 7]
var capacity: Int = 7

//Knapsack via Recursion
KnapsackRecursive().calculate(weight: weight, value: value, capacity: capacity, size: weight.count)


//knapsack via Memoization
var dpArray: [[Int]] = Array(repeating: [Int](repeating: -1, count: capacity+1), count: weight.count+1)
var knapsackMemoization = KnapsackMemoization(dp: dpArray)
knapsackMemoization.calculate(weight: weight, value: value, capacity: capacity, size: weight.count)

//knapsack via top-down approach
var dpArray2: [[Int]] = Array(repeating: [Int](repeating: 0, count: capacity+1), count: weight.count+1)
var knapsackTopDown = KnapsackTopDown(dp: dpArray2)
knapsackTopDown.calculate(weight: weight, value: value, capacity: capacity, size: weight.count)



//Subset Sum tests
var input: [Int] = [2, 3, 7, 8, 10]
var sum = 11
let size = input.count

//Check subset sum via Recursion
print(SubsetSumRecursive().isSubsetSum(arr: input, sum: sum, size: size)) //Should print true

sum = 14
print(SubsetSumRecursive().isSubsetSum(arr: input, sum: sum, size: size)) //Should print false

//Check subset sum via top down approach
print(SubsetSumTopDown(input: input, sum: 5).isSubsetSum()) //Should print true
print(SubsetSumTopDown(input: input, sum: 11).isSubsetSum()) //Should print true
print(SubsetSumTopDown(input: input, sum: 14).isSubsetSum()) //Should print false
print(SubsetSumTopDown(input: input, sum: 0).isSubsetSum()) //Should print true



//Equal Sum Tests
input = [1, 5, 1, 7]
print(EqualSumPartition(input: input).isEqualSumPartitionPossible()) //Should print true

input = [0]
print(EqualSumPartition(input: input).isEqualSumPartitionPossible()) //Should print false



//Subset count with equal sum test
input = [3, 2, 8, 11, 6]
let obj = SubsetCount(input)
print(obj.countEqualSumSubset(11)) //print 3
print(obj.countEqualSumSubset(9))  //print 1
print(obj.countEqualSumSubset(0))  //print 1
print(obj.countEqualSumSubset(8))  //print 2
print(obj.countEqualSumSubset(41)) //print 0



//Minimum subset sum difference
input = [1, 6, 11, 2]
print(MinSubsetSumDiff(input: input).findMinimumSubsetSumDifference())  //print 2

input = [1, 8, 7]
print(MinSubsetSumDiff(input: input).findMinimumSubsetSumDifference())  //print 0


//Subset count with given difference
input = [1, 1, 2, 3]
print(SubsetCountWithGivenDiff(input).count(1)) //print 3


//Unbounded Knapsack
value = [1, 30]
weight = [1, 50]
capacity = 100
print(UnboundedKnapsack(value, weight, capacity).calculate()) //print 100

value = [10, 40, 50, 70]
weight = [1, 3, 4, 5]
capacity = 8
print(UnboundedKnapsack(value, weight, capacity).calculate()) //print 110


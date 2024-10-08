/*
 Task 1:
    Given an integer array of coins[] of size N representing different types of denominations and an integer sum.
    Task is to count all combinations of coins to make a given value sum.

    Note: Assume that you have an infinite supply of each type of coin.
 
 Task 2:
    Given an array coins[] of size N and a target value sum, where coins[i] represents the coins of different denominations.
    The task is to find minimum number of coins required to make the given value sum. 
    If it’s not possible to make a change, print -1.
 
    Note: Assume that you have an infinite supply of each type of coin.
*/

import Foundation

public struct CoinChange {
    public let coins: [Int]
    
    public init(_ coins: [Int]) {
        self.coins = coins
    }
    
    public func calculateNumOfCombination(_ sum: Int) -> Int {
        let size = coins.count
        
        //Initialization
        var dp = Array(repeating: [Int](repeating: 0, count: sum+1), count: size+1)
        dp[0][0] = 1
        
        //Calculate dp matrix
        for i in 1...size {
            for j in 0...sum {
                if coins[i-1] <= j {
                    dp[i][j] = dp[i-1][j] + dp[i][j-coins[i-1]]
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        
        return dp[size][sum]
    }
    
    //DP via Bottom-up Approach
    public func minNumOfCoins(_ sum: Int) -> Int {
        if sum == 0 { return -1 }
        
        let size = coins.count

        // table[i] will be storing the minimum number of coins
        // required for i value.  So table[sum] will have result
        var dp = Array(repeating: Int.max, count: sum+1)
        dp[0] = 0
        
        // Compute minimum coins required for all
        // values from 1 to sum
        for i in 1...sum {
            // Go through all coins smaller than i
            for j in 0..<size {
                if (coins[j] <= i) {
                    let sub_res = dp[i - coins[j]]
                    if sub_res != Int.max && sub_res + 1 < dp[i] {
                        dp[i] = sub_res + 1
                    }
                }
            }
        }

        if dp[sum] == Int.max {
            return -1
        }
        
        return dp[sum];
    }
}


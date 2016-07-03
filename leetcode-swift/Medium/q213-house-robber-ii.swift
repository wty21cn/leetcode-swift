//
//  q213-house-robber-ii.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/house-robber-ii/
//  Category* :  DynamicProgramming
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Note: This is an extension of House Robber.
 *
 * After robbing those houses on that street, the thief has found himself a new place
 * for his thievery so that he will not get too much attention. This time, all houses
 * at this place are arranged in a circle. That means the first house is the neighbor
 * of the last one. Meanwhile, the security system for these houses remain the same as
 * for those in the previous street.
 *
 * Given a list of non-negative integers representing the amount of money of each house,
 * determine the maximum amount of money you can rob tonight without alerting the police.
 *
 * Credits:Special thanks to @Freezen for adding this problem and creating all test cases.
 *
 **********************************************************************************/

/* 
 
 Dynamic Programming
 
 formula     : dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
 boundary    : dp[s] = nums[s], dp[s + 1] = nums[s], dp[s - 1] = dp[s - 2], s = 0..<nums.endIndex
 explaination:
    The fomula is the same with q198-house-robber. \
    For the most value you can rob when you are at house i, you have two options,
        1.Robbing house i, which means you didn't rob house i - 1
        2.Giving up house i, which means you can get the same value when when you chose to rob house i - 1
    Beacuse all the houses are in a circle, so the boundary is changed.
    You should choose a starting house s to rob where s belongs to 0..<nums.endIndex, and then the boundary becomes you can not rob the house before and after s.
            dp[s + 1] = nums[s]
            dp[s - 1] = dp[s - 2]
 
 */

import Foundation

struct q213 {
    
    class Solution {
        func rob(nums: [Int]) -> Int {
            if nums.isEmpty { return 0 }
            if nums.count == 1 { return nums[0] }
            
            var maxValue = 0
            for s in 0..<nums.endIndex {
                var dp = Array<Int>(count: nums.count, repeatedValue: 0)
                
                if s == nums.endIndex.predecessor() {
                    dp[s] = nums[s]
                    dp[0] = nums[s]
                } else {
                    dp[s] = nums[s]
                    dp[s + 1] = nums[s]
                    for i in (s + 2)..<nums.endIndex {
                        dp[i] = max(dp[i-1], dp[i-2] + nums[i])
                    }
                }
                if s != nums.startIndex {
                    for i in 0..<s-1 {
                        let i1 = i - 1 < dp.startIndex ? i - 1 + dp.endIndex : i - 1
                        let i2 = i - 2 < dp.startIndex ? i - 2 + dp.endIndex : i - 2
                        dp[i] = max(dp[i2] + nums[i], dp[i1])
                    }
                }
                let e = s - 2 < dp.startIndex ? s - 2 + dp.endIndex : s - 2
                if dp[e] > maxValue { maxValue = dp[e] }
            }
            return maxValue
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().rob([1,2,3,4,5,1,2,3,4,5]))
    }
}
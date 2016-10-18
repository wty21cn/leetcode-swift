//
//  q198-house-robber.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/house-robber/
//  Category* :  DynamicProgramming
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * You are a professional robber planning to rob houses along a street. Each house has
 * a certain amount of money stashed, the only constraint stopping you from robbing
 * each of them is that adjacent houses have security system connected and it will
 * automatically contact the police if two adjacent houses were broken into on the same night.
 *
 * Given a list of non-negative integers representing the amount of money of each house,
 * determine the maximum amount of money you can rob tonight without alerting the police.
 *
 *
 **********************************************************************************/

/* 
 
 Dynamic Programming
 
 formula     : dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
 boundary    : dp[0] = nums[0], dp[1] = max(dp[0], nums[1])
 explaination: 
    For the most value you can rob when you are at house i, you have two options,
        1.Robbing house i, which means you didn't rob house i - 1
        2.Giving up house i, which means you can get the same value when when you chose to rob house i - 1
 
 Solution2 optimize space from O(N) to O(1)
 
 */

import Foundation

struct q198 {
    
    class Solution {
        func rob(_ nums: [Int]) -> Int {
            if nums.isEmpty { return 0 }
            if nums.count == 1 { return nums[0] }
            
            var dp = Array<Int>(repeating: 0, count: nums.count)
            dp[0] = nums[0]
            dp[1] = max(dp[0], nums[1])
            for index in nums.indices.suffix(from: 2) {
                dp[index] = max(dp[index - 1], dp[index - 2] + nums[index])
            }
            return dp.last!
        }
    }
    
    class Solution2 {
        func rob(_ nums: [Int]) -> Int {
            var dp1 = 0
            var dp2 = 0
            for index in nums.indices {
                let current = max(dp1, dp2 + nums[index])
                dp2 = dp1
                dp1 = current
            }
            return dp1
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().rob([1,2,3,4,5,1,2,3,4,5]))
        print(Solution2().rob([1,2,3,4,5,1,2,3,4,5]))
    }
}

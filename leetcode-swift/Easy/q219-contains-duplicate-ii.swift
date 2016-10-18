//
//  q219-contains-duplicate-ii.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/contains-duplicate-ii/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given an array of integers and an integer k, find out whether there there are
 * two distinct indices i and j in the array such that nums[i] = nums[j] and
 * the difference between i and j is at most k.
 *
 **********************************************************************************/


import Foundation

struct q219 {
    
    class Solution {
        
        func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
            var hash = [Int:Int]()
            for i in nums.indices.suffix(from: 0) {
                if let index = hash[nums[i]] {
                    if i - index <= k {
                        return true
                    }
                }
                hash[nums[i]] = i
            }
            return false
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().containsNearbyDuplicate([1,0,6,2,3,4,5,0], 2))
    }
}

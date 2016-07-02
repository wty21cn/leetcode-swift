//
//  q217-contains-duplicate.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/contains-duplicate/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given an array of integers, find if the array contains any duplicates.
 * Your function should return true if any value appears at least twice in the array,
 * and it should return false if every element is distinct.
 *
 **********************************************************************************/


import Foundation

struct q217 {
    
    class Solution {
        func containsDuplicate(nums: [Int]) -> Bool {
            
            var distinctSet = Set<Int>()
            for num in nums {
                if distinctSet.contains(num) {
                    return true
                } else {
                    distinctSet.insert(num)
                }
            }
            return false
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().containsDuplicate([1,2,3,4,1]))
    }
}
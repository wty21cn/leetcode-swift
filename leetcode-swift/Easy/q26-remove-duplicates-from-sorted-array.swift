//
//  q26-remove-duplicates-from-sorted-array.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/remove-duplicates-from-sorted-array/
//  Category* :  Array TwoPointers
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a sorted array, remove the duplicates in place such that each element appear
 * only once and return the new length.
 *
 * Do not allocate extra space for another array, you must do this in place with constant memory.
 *
 * For example,
 * Given input array A = [1,1,2],
 *
 * Your function should return length = 2, and A is now [1,2].
 *
 **********************************************************************************/


import Foundation

struct q26 {
    
    class Solution {
        func removeDuplicates(inout nums: [Int]) -> Int {
            if nums.isEmpty {
                return 0
            }
            
            var i = 1, j = 1
            while j < nums.endIndex {
                if nums[j] != nums[i - 1] {
                    nums[i] = nums[j]
                    i += 1
                    j += 1
                } else {
                    j += 1
                }
            }
            return i
        }
    }
    
    static func getSolution() -> Void {
        var array = [1,2,2,2,3,3,4,5,5,6,6]
        let num = Solution().removeDuplicates(&array)
        for i in 0..<num {
            print(array[i], terminator: " ")
        }
    }
}
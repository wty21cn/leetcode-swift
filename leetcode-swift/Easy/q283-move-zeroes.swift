//
//  q283-move-zeroes.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/move-zeroes/
//  Category* :  TwoPointers
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com

/***************************************************************************************
 *
 * Given an array nums, write a function to move all 0's to the end of it while
 * maintaining the relative order of the non-zero elements.
 *
 * For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should
 * be [1, 3, 12, 0, 0].
 *
 * Note:
 * You must do this in-place without making a copy of the array.
 * Minimize the total number of operations.
 *
 * Credits:
 * Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
 *
 ***************************************************************************************/


import Foundation

struct q283 {
    
    class Solution {
        func moveZeroes(_ nums: inout [Int]) {
            if !nums.isEmpty {
                var locIndex = nums.startIndex
                var numIndex = nums.startIndex
                while numIndex != nums.endIndex {
                    if nums[numIndex] != 0 {
                        nums[locIndex] = nums[numIndex]
                        if locIndex != numIndex {
                            nums[numIndex] = 0
                        }
                        locIndex += 1
                    }
                    numIndex += 1
                }
            }
        }
    }
    
    static func getSolution() -> Void {
        var array: [Int] = [1, 2, 3, 4]
        Solution().moveZeroes(&array)
        print(array)
    }
}

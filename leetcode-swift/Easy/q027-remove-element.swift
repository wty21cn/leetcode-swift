//
//  q027-remove-element.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/remove-element/
//  Category* :  Array TwoPointers
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given an array and a value, remove all instances of that value in place and return the new length.
 *
 * The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 *
 **********************************************************************************/


import Foundation

struct q27 {
    
    class Solution {
        func removeElement(inout nums: [Int], _ val: Int) -> Int {
            var checkIndex = nums.startIndex
            var contentIndex = nums.startIndex
            while checkIndex < nums.endIndex {
                if nums[checkIndex] != val {
                    nums[contentIndex] = nums[checkIndex]
                    contentIndex += 1
                }
                checkIndex += 1
            }
            return contentIndex
        }
    }
    
    class Solution2 {
        func removeElement(inout nums: [Int], _ val: Int) -> Int {
            var lastIndex = nums.endIndex.predecessor()
            var checkIndex = nums.startIndex
            while checkIndex <= lastIndex {
                if nums[checkIndex] == val {
                    nums[checkIndex] = nums[lastIndex]
                    lastIndex -= 1
                } else {
                    checkIndex += 1
                }
            }
            return lastIndex + 1
        }
    }
    
    static func getSolution() -> Void {
        var nums = [1]
        print(Solution2().removeElement(&nums, 3))
        print(nums)
    }
}
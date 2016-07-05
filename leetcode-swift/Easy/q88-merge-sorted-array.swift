//
//  q88-merge-sorted-array.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/merge-sorted-array/
//  Category* :  Array
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given two sorted integer arrays A and B, merge B into A as one sorted array.
 *
 * Note:
 *   You may assume that A has enough space (size that is greater or equal to m + n)
 *   to hold additional elements from B. The number of elements initialized in A and B
 *   are m and n respectively.
 *
 **********************************************************************************/


import Foundation

struct q88 {
    
    class Solution {
        func merge(inout nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            var index = m + n - 1
            var i1 = m - 1
            var i2 = n - 1
            
            while i1 >= nums1.startIndex && i2 >= nums2.startIndex {
                switch nums1[i1] > nums2[i2] {
                case true:
                    nums1[index] = nums1[i1]
                    index -= 1
                    i1 -= 1
                case false:
                    nums1[index] = nums2[i2]
                    index -= 1
                    i2 -= 1
                }
            }
            while i2 >= nums2.startIndex {
                nums1[index] = nums2[i2]
                index -= 1
                i2 -= 1
            }
        }
    }
    
    static func getSolution() -> Void {
        var nums1 = [1,2,3,0,0,0]
        Solution().merge(&nums1, 3, [2,5,6], 3)
        print(nums1)
    }
}
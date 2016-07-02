//
//  q349-Intersection-of-two-arrays
//  leetcode-swift
//  Source*    :  https://leetcode.com/problems/intersection-of-two-arrays/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Given two arrays, write a function to compute their intersection.
 *
 * Example:
 * Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
 *
 * Note:
 * Each element in the result must be unique.
 * The result can be in any order.
 *
 ***************************************************************************************/


import Foundation

struct q349 {
    
    class Solution {
        func intersection(nums1: [Int], _ nums2: [Int]) -> [Int] {
            let hashTable1: Set<Int> = Set(nums1)
            let hashTable2: Set<Int> = Set(nums2)
            var interSection = [Int]()
            for num in hashTable2 {
                if hashTable1.contains(num) {
                    interSection.append(num)
                }
            }
            return interSection
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().intersection([], []))
    }
    
}
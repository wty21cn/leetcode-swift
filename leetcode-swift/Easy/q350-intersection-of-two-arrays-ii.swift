//
//  q350-intersection-of-two-arrays-ii.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/intersection-of-two-arrays-ii/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.imhttps://www.linkedin.com/in/wty21cn
//  Linkedin  :  
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Given two arrays, write a function to compute their intersection.
 *
 * Example:
 * Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
 *
 * Note:
 * Each element in the result should appear as many times as it shows in both arrays.
 * The result can be in any order.
 *
 * Follow up:
 * What if the given array is already sorted? How would you optimize your algorithm?
 * What if nums1's size is small compared to num2's size? Which algorithm is better?
 * What if elements of nums2 are stored on disk, and the memory is limited such that you
 * cannot load all elements into the memory at once?
 *
 ***************************************************************************************/


import Foundation

struct q350 {
    
    class Solution {
        
        func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let hashDict1 = makeHashDict(nums1)
            let hashDict2 = makeHashDict(nums2)
            var interSection = [Int]()
            for (num, time1) in hashDict1 {
                if let time2 = hashDict2[num] {
                    let time = min(time1, time2)
                    for _ in 0..<time {
                        interSection.append(num)
                    }
                }
            }
            return interSection
        }
        
        func makeHashDict(_ nums: [Int]) -> [Int:Int] {
            var hashDict = [Int:Int]()
            for num in nums {
                if let _ = hashDict[num] {
                    hashDict[num]! += 1
                } else {
                    hashDict[num] = 1
                }
            }
            return hashDict
        }
        
    }
    
    //Two array's contents are already sorted.
    class Solution_FollowUp1 {
        
        func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            
            var interSection = [Int]()
            var index1 = nums1.startIndex, index2 = nums2.startIndex
            
            while index1 != nums1.endIndex && index2 != nums2.endIndex {
                
                let num1 = nums1[index1], num2 = nums2[index2]
                
                if num1 == num2 {
                    interSection.append(num1)
                    index1 += 1
                    index2 += 1
                } else if num1 < num2 {
                    index1 += 1
                } else {
                    index2 += 1
                }
            }
            return interSection
        }
    }
    
    
    static func getSolution() -> Void {
        print(Solution_FollowUp1().intersect([1,1,2,2,3,3], [2,2,2,3]))
    }
}

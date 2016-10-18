//
//  q160-majority-element.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/majority-element/
//  Category* :  Array 
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given an array of size n, find the majority element. 
 * The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 *
 * You may assume that the array is non-empty and the majority element always exist in the array.
 *
 * Credits:Special thanks to @ts for adding this problem and creating all test cases.
 *
 **********************************************************************************/


import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


struct q169 {
    
    class Solution {
        func majorityElement(_ nums: [Int]) -> Int {
            var counter = [Int:Int]()
            var majority = 0
            let majorityCount = Int(floor(Double(nums.count)/2.0))
            
            for num in nums {
                if let _ = counter[num] {
                    counter[num]! += 1
                } else {
                    counter[num] = 1
                }
                if counter[num] > majorityCount {
                    majority = num
                }
            }
            return majority
        }
    }
    
    //Shorter but slower solution
    class Solution2 {
        func majorityElement(_ nums: [Int]) -> Int {
            return nums.sorted{ $0 < $1 }[nums.count/2]
        }
    }
    
    static func getSolution() -> Void {
        print(Solution2().majorityElement([1,2,2,2,2,3,3,3,3,3,3,4]))
    }
}

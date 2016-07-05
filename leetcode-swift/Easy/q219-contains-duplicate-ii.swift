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


import Foundation

struct q219 {
    
    class Solution {
        
        func containsNearbyDuplicate(nums: [Int], _ k: Int) -> Bool {
            var hash = [Int:Int]()
            for i in 0..<nums.endIndex {
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
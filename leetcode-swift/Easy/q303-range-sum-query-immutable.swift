//
//  q303-range-sum-query-immutable.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/range-sum-query-immutable/
//  Category* :
//
//  Created by Tianyu Wang on 16/7/8.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Given an integer array nums, find the sum of the elements between indices i and j
 * (i ≤ j), inclusive.
 *
 * Example:
 * Given nums = [-2, 0, 3, -5, 2, -1]
 *
 * sumRange(0, 2) -> 1
 * sumRange(2, 5) -> -1
 * sumRange(0, 5) -> -3
 * Note:
 * You may assume that the array does not change.
 * There are many calls to sumRange function.
 *
 ***************************************************************************************/


import Foundation

struct q303 {
    
    class NumArray {
        
        var sum: [IntMax]!   //sum[i] store the first i elements' sum
        
        init(_ n: [Int]) {
            sum = [IntMax](repeating: 0, count: n.count + 1)
            for i in 0..<n.count {
                sum[i + 1] = sum[i] + n[i]
            }
        }
        
        func sumRange(_ i: Int, _ j: Int) -> Int {    //i, j are indexs start from zero
            return sum[j+1] - sum[i]
        }
    }
    
    static func getSolution() -> Void {
        let nums = NumArray([1,2,3,4,5,6,7,8,9,10])
        print(nums.sumRange(0,1))
    }
}

//
//  q258-add-digits.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/add-digits/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/**********************************************************************************
 *
 * Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
 *
 * For example:
 * Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.
 *
 * Follow up:
 * 	Could you do it without any loop/recursion in O(1) runtime?
 *
 **********************************************************************************/


import Foundation

struct q258 {
    
    class Solution {
        func addDigits(num: Int) -> Int {
            var num = num
            while num / 10 != 0 {
                var sum = 0
                while num / 10 != 0 {
                    sum += num % 10
                    num = num / 10
                }
                num += sum
            }
            return num
        }
    }
    
    class FollowUpSolution {
        func addDigits(num: Int) -> Int {
            return (num - 1) % 9 + 1
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().addDigits(10))
    }
}
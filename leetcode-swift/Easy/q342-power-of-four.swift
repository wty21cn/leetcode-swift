//
//  q342-power-of-four.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/power-of-four/
//  Category* :  Math BitManipulation
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com

/***************************************************************************************
 *
 * Given an integer (signed 32 bits), write a function to check whether it is a power
 * of 4.
 *
 * Example:
 * Given num = 16, return true.
 * Given num = 5, return false.
 *
 * Follow up: Could you solve it without loops/recursion?
 *
 * Credits:Special thanks to @yukuairoy  for adding this problem and creating all test
 * cases.
 ***************************************************************************************/


/* 
 
 If a number is a power of 4
 
    1.first it should be a power of 2, so check num & (num -1)
    2.For the binary format of this number, the number of 0 on the right of 1 should be even.
 
 */

import Foundation

struct q342 {
    
    class Solution {
        func isPowerOfFour(num: Int) -> Bool {
            
            if num <= 0 { return false }
            
            var num = num
            if num & (num - 1) == 0 {
                var numOfZero = 0
                while num & 0b1 == 0 {
                    numOfZero += 1
                    num >>= 1
                }
                if numOfZero % 2 == 0 {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isPowerOfFour(8))
    }
}
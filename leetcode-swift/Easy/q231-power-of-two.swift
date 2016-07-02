//
//  q231-power-of-two.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/power-of-two/
//  Category* :  Math BitManipulation
//
//  Created by Tianyu Wang on 16/6/29.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com





/**********************************************************************************
 *
 * Given an integer, write a function to determine if it is a power of two.
 *
 * Credits:Special thanks to @jianchao.li.fighter for adding this problem and creating
 * all test cases.
 *
 *
 *
 **********************************************************************************/


import Foundation

struct q231 {
    
    class Solution {
        func isPowerOfTwo(n: Int) -> Bool {
            
            var n = n
            if n <= 0 {
                return false
            }
            while n % 2 == 0 {
                n /= 2
            }
            return n == 1
            
        }
    }
    
    class Solution2 {
        func isPowerOfTwo(n: Int) -> Bool {
            return n > 0 && (n & (n - 1) == 0)
        }
    }
    
    static func getSolution() -> Void {
        print(Solution2().isPowerOfTwo(8388608))
    }
}


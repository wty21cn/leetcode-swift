//
//  q326-power-of-three.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/power-of-three/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/6/29.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Given an integer, write a function to determine if it is a power of three.
 *
 *     Follow up:
 *     Could you do it without using any loop / recursion?
 *
 * Credits:Special thanks to @dietpepsi for adding this problem and creating all test
 * cases.
 *
 ***************************************************************************************/


import Foundation

struct q326 {
    
    class Solution {
        func isPowerOfThree(n: Int) -> Bool {
            let m = log10(Double(n))/log10(3.0)
            let epsilon = 0.000000000001
            return !m.isNaN && !m.isInfinite ? (m + epsilon) % 1 < 2 * epsilon : false
        }
    }
    
    class Solution2 {
        func isPowerOfThree(n: Int) -> Bool {
            var n = n
            if n <= 0 {
                return false
            }
            while n % 3 == 0 {
                n /= 3
            }
            return n == 1
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isPowerOfThree(387420489))
    }
}
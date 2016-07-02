//
//  q263-ugly-number.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/ugly-number/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/***************************************************************************************
 *
 * Write a program to check whether a given number is an ugly number.
 *
 * Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. For
 * example, 6, 8 are ugly while 14 is not ugly since it includes another prime factor 7.
 *
 * Note that 1 is typically treated as an ugly number.
 *
 * Credits:Special thanks to @jianchao.li.fighter for adding this problem and creating
 * all test cases.
 *
 ***************************************************************************************/


import Foundation

struct q263 {
    
    class Solution {
        func isUgly(num: Int) -> Bool {
            var num = num
            if num == 0 { return false }
            if num == 1 { return true }
            while (num % 2 == 0) { num /= 2 }
            while (num % 3 == 0) { num /= 3 }
            while (num % 5 == 0) { num /= 5 }
            return num == 1
            
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isUgly(25))
        print(Solution().isUgly(30))
    }
}
//
//  q7-reverse-integer.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/reverse-integer/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Reverse digits of an integer.
 *
 * Example1: x =  123, return  321
 * Example2: x = -123, return -321
 *
 *
 * Have you thought about this?
 *
 * Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!
 *
 * > If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.
 *
 * > Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer,
 *   then the reverse of 1000000003 overflows. How should you handle such cases?
 *
 * > Throw an exception? Good, but what if throwing an exception is not an option?
 *   You would then have to re-design the function (ie, add an extra parameter).
 *
 **********************************************************************************/


import Foundation

struct q007 {
    
    class Solution {
        func reverse(x: Int) -> Int {
            var x = x
            var reversedX = 0
            while x != 0 {
                reversedX = reversedX * 10 + x % 10
                x /= 10
                if (reversedX < 0 && x != 0 && Int(Int32.min) / 10 > reversedX ) { return 0 }
                if (reversedX > 0 && x != 0 && Int(Int32.max) / 10 < reversedX ) { return 0 }
            }
            return reversedX
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().reverse(1534236469))
        print(Solution().reverse(-9223372036854774999))
        print(Solution().reverse(9223372036854774999))
        print(Solution().reverse(-2147483412))
    }
}
//
//  q190-reverse-bits.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/reverse-bits/
//  Category* :  BitManipulation Math
//
//  Created by Tianyu Wang on 16/7/6.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Reverse bits of a given 32 bits unsigned integer.
 *
 * For example, given input 43261596 (represented in binary as 00000010100101000001111010011100),
 * return 964176192 (represented in binary as 00111001011110000010100101000000).
 *
 * Follow up:
 * If this function is called many times, how would you optimize it?
 *
 * Related problem: Reverse Integer
 *
 * Credits:Special thanks to @ts for adding this problem and creating all test cases.
 *
 **********************************************************************************/


import Foundation

struct q190 {
    
    class Solution {
        func reversedBits(n: UInt32) -> UInt32 {
            var n: UInt32 = n
            var m: UInt32 = 0
            var i: UInt32 = 32
            while i > 0 && n != 0  {
                m = m << 1 + n & 0b1
                n = n >> 1
                i -= 1
            }
            m = m << i
            return m
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().reversedBits(3758096391))
    }
}
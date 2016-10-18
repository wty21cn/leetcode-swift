//
//  q172-factorial-trailing-zeroes.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/factorial-trailing-zeroes/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given an integer n, return the number of trailing zeroes in n!.
 *
 * Note: Your solution should be in polynomial time complexity.
 *
 * Credits:Special thanks to @ts for adding this problem and creating all test cases.
 *
 **********************************************************************************/

/* 
 
 5 * 2 = 10, the trailing zereos comes from this equation
 n / 5 can calculate how many five we have from 1 to n
 n / 25 = n / (5 * 5), this will give us extra 5 compare to n / 5
 n / 125 = n / (5 * 5 * 5), more extra 5
 ...
 
 */


import Foundation

struct q172 {
    
    class Solution {
        func trailingZeroes(_ n: Int) -> Int {
            var numOfZeros = 0
            var countNum = 5
            while n / countNum >= 1 {
                numOfZeros += n / countNum
                countNum *= 5
            }
            return numOfZeros
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().trailingZeroes(100))
    }
}

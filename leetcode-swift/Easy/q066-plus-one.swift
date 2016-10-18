//
//  q066-plus-one.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/plus-one/
//  Category* :  Array
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a non-negative number represented as an array of digits, plus one to the number.
 *
 * The digits are stored such that the most significant digit is at the head of the list.
 *
 **********************************************************************************/


import Foundation

struct q66 {
    
    class Solution {
        func plusOne(_ digits: [Int]) -> [Int] {
            
            var digits = digits
            var index = (digits.endIndex - 1)
            var adding = 0
            digits[index] += 1
            
            while index >= digits.startIndex {
                digits[index] += adding
                adding = digits[index] / 10
                if adding > 0 {
                    digits[index] %= 10
                }
                index = (index - 1)
            }
            if adding > 0 {
                digits.insert(adding, at: 0)
            }
            return digits
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().plusOne([1,9]))
        print(Solution().plusOne([9,9]))
    }
}

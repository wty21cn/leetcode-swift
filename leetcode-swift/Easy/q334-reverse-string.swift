//
//  q334-reverse-string.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/reverse-string/
//  Category* :  String
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/***************************************************************************************
 *
 * Write a function that takes a string as input and returns the string reversed.
 *
 * Example:
 * Given s = "hello", return "olleh".
 *
 ***************************************************************************************/


import Foundation

struct q344 {
    
    class Solution {
        func reverseString(s: String) -> String {
            return String(s.characters.reverse())
        }
    }
    
    static func getSolution() -> Void {
        let solution = Solution()
        print(solution.reverseString("123"))
    }
}
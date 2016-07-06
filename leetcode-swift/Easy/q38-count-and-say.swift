//
//  q38-count-and-say.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/count-and-say/
//  Category* :  String
//
//  Created by Tianyu Wang on 16/7/6.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * The count-and-say sequence is the sequence of integers beginning as follows:
 * 1, 11, 21, 1211, 111221, ...
 *
 * 1 is read off as "one 1" or 11.
 * 11 is read off as "two 1s" or 21.
 * 21 is read off as "one 2, then one 1" or 1211.
 *
 * Given an integer n, generate the nth sequence.
 *
 * Note: The sequence of integers will be represented as a string.
 *
 **********************************************************************************/


import Foundation

struct q38 {
    
    class Solution {
        func countAndSay(n: Int) -> String {
            var str = "1"
            for _ in 1..<n {
                var tmpStr = ""
                var pNum = 0
                var pChar = str.characters.first
                for (_, char) in str.characters.enumerate() {
                    if char == pChar {
                        pNum += 1
                    } else {
                        tmpStr += "\(pNum)\(pChar!)"
                        pChar = char
                        pNum = 1
                    }
                }
                if pNum != 0 {
                    tmpStr += "\(pNum)\(pChar!)"
                }
                str = tmpStr
            }
            return str
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().countAndSay(6))
    }
}
//
//  q058-length-of-last-word.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/subscribe/
//  Category* :  String
//
//  Created by Tianyu Wang on 16/7/6.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a string s consists of upper/lower-case alphabets and empty space characters ' ',
 * return the length of last word in the string.
 *
 * If the last word does not exist, return 0.
 *
 * Note: A word is defined as a character sequence consists of non-space characters only.
 *
 * For example,
 * Given s = "Hello World",
 * return 5.
 *
 **********************************************************************************/


import Foundation

struct q58 {
    
    class Solution {
        func lengthOfLastWord(_ s: String) -> Int {
            if let lastWord = s.components(separatedBy: " ").filter({ $0 != "" }).last {
                return lastWord.characters.count
            } else {
                return 0
            }
        }
    }
    
    class Solution2 {
        func lengthOfLastWord(_ s: String) -> Int {
            if s.isEmpty {
                return 0
            }
            let s = Array(s.characters)
            var length =  s.count
            var lastWordLength = 0
            
            //trim
            while length > 0 && s[length - 1] == " " {
                length -= 1
            }
            
            while length > 0 && s[length - 1] != " " {
                lastWordLength += 1
                length -= 1
            }
            
            return lastWordLength
        }
    }
    
    static func getSolution() -> Void {
        print(Solution2().lengthOfLastWord(" abcdefgh  abcdefg   "))
    }
}

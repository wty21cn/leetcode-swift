//
//  q345-reverse-vowels-of-a-string.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/reverse-vowels-of-a-string/
//  Category* :  String
//
//  Created by Tianyu Wang on 16/7/2.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Write a function that takes a string as input and reverse only the vowels of a
 * string.
 *
 * Example 1:
 * Given s = "hello", return "holle".
 *
 * Example 2:
 * Given s = "leetcode", return "leotcede".
 *
 ***************************************************************************************/


import Foundation

struct q345 {
    
    class Solution {
        func reverseVowels(_ s: String) -> String {
            
            if s.isEmpty {
                return s
            }
            
            var s = s
            let vowels = "aAeEiIoOuU".characters
            var headIndex = s.startIndex
            var tailIndex = s.characters.index(before: s.endIndex)
            
            while  headIndex < tailIndex{
                while !vowels.contains(s[headIndex]) && headIndex < tailIndex {
                    headIndex = s.index(after: headIndex)
                }
                
                while !vowels.contains(s[tailIndex]) && headIndex < tailIndex {
                    tailIndex = s.index(before: tailIndex)
                }
                
                if headIndex == tailIndex {
                    break
                }
                
                let tmp = s[headIndex]
                s.replaceSubrange(headIndex...headIndex, with: "\(s[tailIndex])")
                s.replaceSubrange(tailIndex...tailIndex, with: "\(tmp)")
                
                headIndex = s.index(after: headIndex)
                tailIndex = s.index(before: tailIndex)
            }
            return s
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().reverseVowels("12"))
    }
}

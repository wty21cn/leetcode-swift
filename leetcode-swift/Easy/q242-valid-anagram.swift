//
//  q242-valid-anagram.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/valid-anagram/
//  Category* :  String Hash
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/**********************************************************************************
 *
 * Given two strings s and t, write a function to determine if t is an anagram of s.
 *
 * For example,
 * s = "anagram", t = "nagaram", return true.
 * s = "rat", t = "car", return false.
 *
 * Note:
 * You may assume the string contains only lowercase alphabets.
 *
 **********************************************************************************/


import Foundation

struct q242 {
    
    class Solution {
        func isAnagram(s: String, _ t: String) -> Bool {
            let charCountS = countCharacter(s)
            let charCountT = countCharacter(t)
            if s.characters.count != t.characters.count {
                return false
            }
            for (key, value) in charCountS {
                if let count = charCountT[key] {
                    if count == value {
                        continue
                    }
                }
                return false
            }
            return true
        }
        
        func countCharacter(s: String) -> [Character:Int] {
            var charCount = [Character:Int]()
            for character in s.characters {
                if let _ = charCount[character] {
                    charCount[character]! += 1
                } else {
                    charCount[character] = 1
                }
            }
            return charCount
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isAnagram("1233214", "3211233"))
    }
}
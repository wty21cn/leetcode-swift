//
//  q290-word-pattern.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/word-pattern/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Given a pattern and a string str, find if str follows the same pattern.
 *  Here follow means a full match, such that there is a bijection between a letter in
 * pattern and a non-empty word in str.
 *
 * Examples:
 *
 * pattern = "abba", str = "dog cat cat dog" should return true.
 * pattern = "abba", str = "dog cat cat fish" should return false.
 * pattern = "aaaa", str = "dog cat cat dog" should return false.
 * pattern = "abba", str = "dog dog dog dog" should return false.
 *
 * Notes:
 * You may assume pattern contains only lowercase letters, and str contains lowercase
 * letters separated by a single space.
 *
 * Credits:Special thanks to @minglotus6 for adding this problem and creating all test
 * cases.
 *
 ***************************************************************************************/


import Foundation

struct q290 {
    
    class Solution {
        
        fileprivate var patternRules = [Character:[Int]]()
        fileprivate var patternKey = Set<String>()
        
        func wordPattern(_ pattern: String, _ str: String) -> Bool {
            
            for (i, char) in pattern.characters.enumerated()  {
                if patternRules[char] != nil {
                    patternRules[char]!.append(i)
                } else {
                    patternRules[char] = [i]
                }
            }
            
            let words = str.components(separatedBy: " ")
            
            if words.count != pattern.characters.count { return false }
            
            for (_, patternRule) in patternRules {
                let key: String = words[patternRule.first!]
                for i in patternRule {
                    if key != words[i] { return false }
                }
                if patternKey.contains(key) {
                    return false
                } else {
                    patternKey.insert(key)
                }
            }
            return true
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().wordPattern("abba", "dog cat cat fish"))
    }
}

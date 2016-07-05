//
//  q205-isomorphic-strings.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/isomorphic-strings/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given two strings s and t, determine if they are isomorphic.
 *
 * Two strings are isomorphic if the characters in s can be replaced to get t.
 *
 * All occurrences of a character must be replaced with another character while preserving
 * the order of characters. No two characters may map to the same character but a character
 *  may map to itself.
 *
 * For example,
 *
 *     Given "egg", "add", return true.
 *
 *     Given "foo", "bar", return false.
 *
 *     Given "paper", "title", return true.
 *
 * Note:
 * You may assume both s and t have the same length.
 *
 **********************************************************************************/


import Foundation

struct q205 {
    
    class Solution {
        func isIsomorphic(s: String, _ t: String) -> Bool {
            var hash = [Character:Character]()
            var map = Set<Character>()
            var s = Array(s.characters)
            var t = Array(t.characters)
            for i in 0..<s.endIndex {
                if let r = hash[s[i]] {
                    if r != t[i] {
                        return false
                    }
                } else {
                    if map.contains(t[i]) {
                       return false
                    }
                    hash[s[i]] = t[i]
                    map.insert(t[i])
                }
            }
            return true
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isIsomorphic("egg", "add"))
        print(Solution().isIsomorphic("foo", "bar"))
        print(Solution().isIsomorphic("papre", "title"))
        print(Solution().isIsomorphic("ab", "aa"))
        
    }
}
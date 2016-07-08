//
//  q014-longest-common-prefix.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/longest-common-prefix/
//  Category* :  String
//
//  Created by Tianyu Wang on 16/7/7.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Write a function to find the longest common prefix string amongst an array of strings.
 *
 **********************************************************************************/


import Foundation

struct q14 {
    
    class Solution {
        func longestCommonPrefix(strs: [String]) -> String {
            var s: String?          //Find the shortest string
            var length = Int.max    //Shortest string's length
            
            for str in strs {
                if str.characters.count < length {
                    length = str.characters.count
                    s = str
                }
            }
            
            if var s = s {
                var subrange = s.startIndex..<s.endIndex
                for str in strs {
                    while !s.isEmpty && !str.hasPrefix(s) {
                        subrange.endIndex = subrange.endIndex.predecessor()
                        s = s[subrange]
                    }
                }
                return s
            } else {
                return ""
            }
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().longestCommonPrefix(["ab","ac","abc","abcd"]))
    }
}
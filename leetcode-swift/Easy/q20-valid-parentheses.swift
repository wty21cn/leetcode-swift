//
//  q20-valid-parentheses.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/valid-parentheses/
//  Category* :  Stack
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


import Foundation

struct q20 {
    
    class Solution {
        func isValid(s: String) -> Bool {
            let rule = Array("()[]{}".characters)
            var stack = [Character]()
            for (_, char) in s.characters.enumerate() {
                if rule.indexOf(char)! % 2 == 0 {    // open brackets
                    stack.append(char)
                } else {                            // close brackets
                    if stack.isEmpty {
                        return false
                    } else {
                        if rule.indexOf(char)! - rule.indexOf(stack.last!)! == 1 {
                            stack.removeLast()
                        } else {
                            return false
                        }
                    }
                }
            }
            return stack.isEmpty
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isValid("(("))
        print(Solution().isValid("(])"))
        print(Solution().isValid("([{}])"))
        print(Solution().isValid("()[]{}"))
        print(Solution().isValid("([{)]}"))

 
    }
}
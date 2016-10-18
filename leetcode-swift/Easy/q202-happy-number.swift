//
//  q202-happy-number.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/happy-number/
//  Category* :  Math Hash
//
//  Created by Tianyu Wang on 16/6/29.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/**********************************************************************************
 *
 * Write an algorithm to determine if a number is "happy".
 *
 * A happy number is a number defined by the following process: Starting with any positive integer,
 * replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1
 * (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this
 * process ends in 1 are happy numbers.
 *
 * Example: 19 is a happy number
 *
 * 1^2 + 9^2 = 82
 * 8^2 + 2^2 = 68
 * 6^2 + 8^2 = 100
 * 1^2 + 0^2 + 0^2 = 1
 *
 * Credits:Special thanks to @mithmatt and @ts for adding this problem and creating all test cases.
 *
 **********************************************************************************/


import Foundation

struct q202 {
    
    class Solution {
        
        var hashTable: Set<String>!
        
        func isHappy(_ n: Int) -> Bool {
            hashTable = Set<String>()
            var n = n
            while true {
                var digits = [Int]()
                while n != 0 {
                    digits.append(n % 10)
                    n /= 10
                }
                
                if exist(digits) { return false }
                
                for digit in digits {
                    n += (digit * digit)
                }
                
                if n == 1 { return true }
            }
            
        }
        
        func exist(_ digits: [Int]) -> Bool {
            let digits = digits.sorted()
            var hash = ""
            for digit in digits {
                hash += "\(digit)"
            }
            if hashTable.contains(hash) {
                return true
            } else {
                hashTable.insert(hash)
                return false
            }
            
        }
        
    }
    
    static func getSolution() -> Void {
        print(Solution().isHappy(8))
    }
}

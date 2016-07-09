//
//  q067-add-binary.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/add-binary/
//  Category* :  String BitManipulation
//
//  Created by Tianyu Wang on 16/7/7.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given two binary strings, return their sum (also a binary string).
 *
 * For example,
 * a = "11"
 * b = "1"
 * Return "100".
 *
 **********************************************************************************/


import Foundation

struct q67 {
    
    class Solution {
        func addBinary(a: String, _ b: String) -> String {
            
            var result = ""
            var a = Array(a.characters)
            var b = Array(b.characters)
            
            var indexA = a.count - 1
            var indexB = b.count - 1
            var carry = 0
            while indexA >= 0 || indexB >= 0 {
                //a and b may have different length
                let bitA = indexA >= 0 ? Int(String(a[indexA]), radix: 2) : 0
                let bitB = indexB >= 0 ? Int(String(b[indexB]), radix: 2) : 0
                var sum = bitA! + bitB! + carry
                carry = sum / 2
                sum %= 2
                result.insert("\(sum)".characters.first!, atIndex: result.startIndex)
                indexA -= 1
                indexB -= 1
            }
            if carry != 0 {
                result.insert("\(carry)".characters.first!, atIndex: result.startIndex)
            }
            return result
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().addBinary("110", "11"))
    }
}
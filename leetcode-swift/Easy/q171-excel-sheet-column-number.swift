//
//  q171-excel-sheet-column-number.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/excel-sheet-column-number/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com

/**********************************************************************************
 *
 * Related to question Excel Sheet Column Title
 * Given a column title as appear in an Excel sheet, return its corresponding column number.
 *
 * For example:
 *     A -> 1
 *     B -> 2
 *     C -> 3
 *     ...
 *     Z -> 26
 *     AA -> 27
 *     AB -> 28
 *
 * Credits:Special thanks to @ts for adding this problem and creating all test cases.
 *
 **********************************************************************************/


import Foundation

struct q171 {
    
    class Solution {
        func titleToNumber(s: String) -> Int {
            let scalarOfA = "A".unicodeScalars.first
            var columnNumber = 0
            for c in s.characters {
                let scalar = String(c).unicodeScalars.first
                if let _ = scalarOfA, _ = scalar {
                    let value = Int(scalar!.value - scalarOfA!.value + 1)
                    columnNumber = columnNumber * 26 + value
                } else {
                    return 0
                }
            }
            return columnNumber
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().titleToNumber("AB"))
    }
}
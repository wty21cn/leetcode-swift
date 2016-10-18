//
//  q119-pascals-triangle-ii.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/pascals-triangle-ii/
//  Category* :  Array Math
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given an index k, return the kth row of the Pascal's triangle.
 *
 * For example, given k = 3,
 * Return [1,3,3,1].
 *
 * Note:
 * Could you optimize your algorithm to use only O(k) extra space?
 *
 **********************************************************************************/


import Foundation

struct q119 {
    
    class Solution {
        func c(m: Int, n: Int) -> Int {
            var result = 1, i = 1, j = m
            while i <= n {
                result = result * j / i
                i += 1
                j -= 1
            }
            return result
        }
        func getRow(_ rowIndex: Int) -> [Int] {
            var row = [Int]()
            for i in 0...rowIndex {
                if i <= rowIndex / 2 {
                    row.append(c(m: rowIndex, n: i))
                } else {
                    row.append(row[rowIndex - i])
                }
            }
            return row
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().getRow(5))
    }
}

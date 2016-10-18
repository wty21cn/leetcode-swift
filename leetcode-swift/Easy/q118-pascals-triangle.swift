//
//  q118-pascals-triangle.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/pascals-triangle/
//  Category* :  Array Math
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given numRows, generate the first numRows of Pascal's triangle.
 *
 * For example, given numRows = 5,
 * Return
 *
 * [
 *      [1],
 *     [1,1],
 *    [1,2,1],
 *   [1,3,3,1],
 *  [1,4,6,4,1]
 * ]
 *
 **********************************************************************************/


import Foundation

struct q118 {
    
    class Solution {
        func generate(_ numRows: Int) -> [[Int]] {
            if numRows == 0 {
                return []
            }
            var result = [[1]]
            for row in 1..<numRows {
                result.append([1])
                for i in 1..<row {
                    result[row].append(result[row-1][i-1] + result[row-1][i])
                }
                result[row].append(1)
            }
            return result
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().generate(0))
    }
}

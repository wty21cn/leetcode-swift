//
//  q013-roman-to-integer.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/roman-to-integer/
//  Category* :  String Math
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/**********************************************************************************
 *
 * Given a roman numeral, convert it to an integer.
 *
 * Input is guaranteed to be within the range from 1 to 3999.
 *
 **********************************************************************************/

/*
 
 1.相同的数字连写，所表示的数等于这些数字相加得到的数，如 Ⅲ=3；
 2.小的数字在大的数字的右边，所表示的数等于这些数字相加得到的数，如 Ⅷ=8、Ⅻ=12；
 3.小的数字（限于 Ⅰ、X 和 C）在大的数字的左边，所表示的数等于大数减小数得到的数，如 Ⅳ=4、Ⅸ=9；
 4.在一个数的上面画一条横线，表示这个数增值 1,000 倍;
 注意：从右往左按规则进行计数
 
 */


import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


struct q13 {
    
    class Solution {
        func romanToInt(_ s: String) -> Int {
            
            let romanUnit = [Character("I"):1, Character("V"):5, Character("X"):10,
                             Character("L"):50, Character("C"):100, Character("D"):500,
                             Character("M"):1000]
            
            let reversedChars = s.characters.reversed()
            var integer = 0
            var index = reversedChars.startIndex
            while index != reversedChars.endIndex {
                let char1 = reversedChars[index]
                if reversedChars.index(after: index) == reversedChars.endIndex {
                    integer += romanUnit[char1]!
                    break
                }
                let char2 = reversedChars[reversedChars.index(after: index)]
                
                if romanUnit[char1] > romanUnit[char2] && ["I", "C", "X"].contains(String(char2)) {
                    
                    integer = integer + romanUnit[char1]! - romanUnit[char2]!
                    index = reversedChars.index(index, offsetBy: 2)
                    
                } else  {
                    
                    integer += romanUnit[char1]!
                    index = reversedChars.index(after: index)
                    
                }
            }
            
            return integer
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().romanToInt("MCMXCVI"))
    }
}

//
//  q009-palindrome-number.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/palindrome-number/
//  Category* :  Math
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Determine whether an integer is a palindrome. Do this without extra space.
 *
 *
 * Some hints:
 *
 * Could negative integers be palindromes? (ie, -1)
 *
 * If you are thinking of converting the integer to string, note the restriction of using extra space.
 *
 * You could also try reversing an integer. However, if you have solved the problem "Reverse Integer",
 * you know that the reversed integer might overflow. How would you handle such case?
 *
 * There is a more generic way of solving this problem.
 *
 **********************************************************************************/


import Foundation

struct q9 {
    
    class Solution {
        func isPalindrome(_ x: Int) -> Bool {
            if x < 0 || x % 10 == 0 {
                 return x == 0
            } 
            var x = x
            var halfReversedX = 0
            while x > halfReversedX {
                halfReversedX = halfReversedX * 10 + x % 10
                x /= 10
            }
            // even num of digits situation || odd num of digits situaition
            return x == halfReversedX || x == halfReversedX / 10
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().isPalindrome(12344321))
        print(Solution().isPalindrome(123421))
        print(Solution().isPalindrome(0))
        print(Solution().isPalindrome(10))
        
    }
}

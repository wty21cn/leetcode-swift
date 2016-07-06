//
//  q070-climbing-stairs.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/climbing-stairs/
//  Category* :  DynamicProgramming
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com

/**********************************************************************************
 *
 * You are climbing a stair case. It takes n steps to reach to the top.
 *
 * Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 *
 **********************************************************************************/

/* 
 
 Dynamic Programming:
 
 f[i] = f[i -1] + f[i - 2] 
 f[0,1,2] = [0,1,2]
 
 */


import Foundation

struct q70 {
    
    class Solution {
        func climbStairs(n: Int) -> Int {
            
            var numOfWays = [0,1,2]
            if n < 3 { return numOfWays[n] }
            
            for i in 3...n {
                numOfWays.append(numOfWays[i - 1] + numOfWays[i - 2])
            }
            return numOfWays[n]
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().climbStairs(30))
    }
}
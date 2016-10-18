//
//  q028-implement-strstr.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/implement-strstr/
//  Category* :  String
//
//  Created by Tianyu Wang on 16/7/8.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Implement strStr().
 *
 * Returns a pointer to the first occurrence of needle in haystack, or null if needle is not part of haystack.
 *
 **********************************************************************************/

/*
 
  <----------k---------->        <----------k---------->
 
 0      h-1     k-h     k-1    j-k  (j-k)+h-1          j-1
 |---1---|-------|---2---|......|---3---|-------|---4---|----
 0 <-h->  h        <-h->  k       <-h->           <-h->  j
 
 - StartPoint：next[0] = -1
 - Suppose for position j in pattern string P，we have next[j] = k
    - that isP0P1P2P...Pk-2Pk-1 = Pj-kPj-k+1P...Pj-2Pj-1
 - So for position j+1 in pattern string P, calculate next[j+1]
    - if P[k] == P[j] then next[j+1] = next[j] + 1
    - if P[k] != P[j] then
        - Set h = next[k]
        - Because area1 == area2 and area2 == area4, so area 1 == area 4
        - then we just need to see if P[h] == P[j]
            - if P[h] == P[j] if next[j+1] = h + 1
            - if P[h] != P[j] then recursively
                - set h = next[h]
                - repeat the process util find P[h] = P[j]
 
 */

import Foundation

struct q28 {
    
    //KMP find substring
    class Solution {
        
        func calculateNext(_ p: [Character]) -> [Int] {
            
            guard !p.isEmpty else {
                return []
            }
            
            var next = Array(repeating: 0, count: p.count)
            next[0] = -1
            var k = next[0]
            
            for i in 1..<p.count {
                var found = false
                while !found {
                    if k == -1 || p[k] == p[i - 1] {
                        found = true
                        k += 1
                        next[i] = k
                    } else {
                        k = next[k]
                        
                    }
                }
            }
            return next
        }
        
        func kmpSearch(p: [Character], s:[Character], sStart: Int, sEnd: Int, next: [Int]) -> Int {
            guard !p.isEmpty else {
                return 0
            }
            var ans = -1
            var sPtr = sStart, pPtr = 0
            
            while (sPtr < sEnd) {
                if pPtr == -1 || s[sPtr] == p[pPtr] {
                    sPtr += 1
                    pPtr += 1
                } else {
                    pPtr = next[pPtr]
                }
                if pPtr == p.count {
                    ans = sPtr - p.count
                    break
                }
            }
            return ans
        }
        
        func strStr(_ haystack: String, _ needle: String) -> Int {
            
            let s = Array(haystack.characters)
            let p = Array(needle.characters)
            let next = calculateNext(p)
            
            return kmpSearch(p: p, s: s, sStart: 0, sEnd: s.count, next: next)
            
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().strStr("mississippi", "issip"))
    }
}

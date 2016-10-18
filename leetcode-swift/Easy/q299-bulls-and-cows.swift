//
//  q299-bulls-and-cows.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/bulls-and-cows/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


import Foundation

struct q299 {
    
    class Solution {
        func getHint(_ secret: String, _ guess: String) -> String {
            
            var cows = 0
            var bulls = 0
            
            let secret = Array(secret.characters)
            let guess = Array(guess.characters)
            
            var digitsCount = Dictionary<Character,Int>()
            
            //count the num of each digit
            for i in 0..<secret.count {
                if let count = digitsCount[secret[i]] {
                    digitsCount[secret[i]] = count + 1
                } else {
                    digitsCount[secret[i]] = 1
                }
            }
            
            
            for i in 0..<guess.count {
                
                if secret[i] == guess[i] {  // bull matched, use one of this digits
                    bulls += 1
                    if var count = digitsCount[secret[i]] {
                        count -= 1
                        if count < 0 {  // previous cows wrongly use this digis
                            cows -= 1
                            digitsCount[secret[i]] = count + 1
                        } else {
                            digitsCount[secret[i]] = count
                        }
                    }
                } else if let count = digitsCount[guess[i]] {
                    if count != 0 {  // this digit still left, cows use one
                        cows += 1
                        digitsCount[guess[i]] = count - 1
                    }
                }
            }
            return "\(bulls)A\(cows)B"
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().getHint("1123", "0111"))
        print(Solution().getHint("1807", "7810"))
        print(Solution().getHint("11", "11"))
        print(Solution().getHint("1122", "2211"))
        print(Solution().getHint("1222", "1122"))
        print(Solution().getHint("6244988279", "3819888600"))
    }
}

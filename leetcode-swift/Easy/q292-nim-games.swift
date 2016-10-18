//
//  q292-nim-games.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/nim-game/
//  Category* :  GameTheory
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * You are playing the following Nim Game with your friend: There is a heap of stones
 * on the table, each time one of you take turns to remove 1 to 3 stones. The one who
 * removes the last stone will be the winner. You will take the first turn to remove
 * the stones.
 *
 * Both of you are very clever and have optimal strategies for the game. Write a
 * function to determine whether you can win the game given the number of stones in the
 * heap.
 *
 * For example, if there are 4 stones in the heap, then you will never win the game: no
 * matter 1, 2, or 3 stones you remove, the last stone will always be removed by your
 * friend.
 *
 *   If there are 5 stones in the heap, could you figure out a way to remove the stones
 * such that you will always be the winner?
 *
 * Credits:Special thanks to @jianchao.li.fighter for adding this problem and creating
 * all test cases.
 *
 ***************************************************************************************/

/*
 
 巴什博弈(同余理论) Bash Game
 先取者必须给对方留下(m+1)的倍数个石子，如不能达成，则先取者必输。其中m为每人一次最多取多少个数
 
*/


import Foundation

struct q292 {
    
    class Solution {
        let m = 3
        func canWinNim(_ n: Int) -> Bool {
            return n % (m + 1) != 0
        }
    }
    
    static func getSolution() -> Void {
        let solution = Solution()
        print(solution.canWinNim(4))
    }
}

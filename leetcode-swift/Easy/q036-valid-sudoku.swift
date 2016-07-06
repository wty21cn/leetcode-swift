//
//  q036-valid-sudoku.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/valid-sudoku/
//  Category* :  Hash
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
 *
 * The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 *
 * A partially filled sudoku which is valid.
 *
 * Note:
 * > A valid Sudoku board (partially filled) is not necessarily solvable.
 *   Only the filled cells need to be validated.
 *
 **********************************************************************************/


import Foundation

struct q36 {
    
    class Solution {
        
        var ruleRow = [Set<Character>](count: 9, repeatedValue: Set<Character>())
        var ruleColumn = [Set<Character>](count: 9, repeatedValue: Set<Character>())
        var ruleSquare = [Set<Character>](count: 9, repeatedValue: Set<Character>())
        
        func isValidSudoku(board: [[Character]]) -> Bool {
            
            var indexOfRow = board.startIndex
            while indexOfRow != board.endIndex {
                
                var row = board[indexOfRow]
                var indexOfChar = row.startIndex
                while indexOfChar != row.endIndex {
                    
                    let char = row[indexOfChar]
                    if char != "." {
                        let passRuleRow = !ruleRow[indexOfRow].contains(char)
                        let passRuleColumn = !ruleColumn[indexOfChar].contains(char)
                        let passRuleSquare = !ruleSquare[(indexOfRow / 3) * 3 + indexOfChar / 3].contains(char)
                        if passRuleRow && passRuleColumn && passRuleSquare {
                            ruleRow[indexOfRow].insert(char)
                            ruleColumn[indexOfChar].insert(char)
                            ruleSquare[(indexOfRow / 3) * 3 + indexOfChar / 3].insert(char)
                            indexOfChar = indexOfChar.successor()
                        } else {
                            return false
                        }
                    } else {
                        indexOfChar = indexOfChar.successor()
                    }
                }
                indexOfRow = indexOfRow.successor()
            }
            return true
        }
    }
    
    static func getSolution() -> Void {
        let row1 = Array("..4...63.".characters)
        let row2 = Array(".........".characters)
        let row3 = Array("5......9.".characters)
        let row4 = Array("...56....".characters)
        let row5 = Array("4.3.....1".characters)
        let row6 = Array("...7.....".characters)
        let row7 = Array("...5.....".characters)
        let row8 = Array(".........".characters)
        let row9 = Array(".........".characters)
        print(Solution().isValidSudoku([row1,row2,row3,row4,row5,row6,row7,row8,row9]))
    }
}
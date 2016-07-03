//
//  q103-binary-tree-zigzag-level-order-traversal.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
//  Category* :  BinaryTree BFS Stack
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a binary tree, return the zigzag level order traversal of its nodes' values.
 * (ie, from left to right, then right to left for the next level and alternate between).
 *
 * For example:
 * Given binary tree {3,9,20,#,#,15,7},
 *
 *     3
 *    / \
 *   9  20
 *     /  \
 *    15   7
 *
 * return its zigzag level order traversal as:
 *
 * [
 *   [3],
 *   [20,9],
 *   [15,7]
 * ]
 *
 **********************************************************************************/


import Foundation

struct q103 {
    
    class Solution {
        func zigzagLevelOrder(root: TreeNode?) -> [[Int]] {
            
            var traversal: [[Int]] = []
            if let root = root {
                var queue:[(TreeNode, Int)] = [(root,0)]
                var head = queue.startIndex, tail = queue.endIndex
                while head < tail {
                    
                    let (node, level) = queue[head]
                    if level >= traversal.endIndex { traversal.append([]) }
                    traversal[level].append(node.val)
                    
                    if let l = node.left { queue.append((l, level + 1)) }
                    if let r = node.right { queue.append((r, level + 1)) }
                    
                    tail = queue.endIndex
                    head = head.successor()
                }
            }
            
            for i in 0..<traversal.endIndex {
                if i % 2 != 0 {
                    traversal[i] = traversal[i].reverse()
                }
            }
            return traversal
        }
    }
    
    
    /*
     
     Solution 2
    
     Use two stack to store each level's nodes, and take advancetage of stack's FILO feature.
     
        1.When this level traverse from left to right
            Add its left child before its right child, then when treaverse the next level, the right child will pop up first
        2.When this level traverse from right to left
            Add its right child before its left child, then when treaverse the next level, the left child will pop up first
    
                1
               --->
              /    \
             2      3
            <---------
           /  \    /  \
          4    5  6    7
          -------------->
     */
    
    
    class Solution2 {
        func zigzagLevelOrder(root: TreeNode?) -> [[Int]] {
            
            var traversal: [[Int]] = []
            if let root = root {
                var stack: [[TreeNode]] = [[root],[]]
                var level = 0
                while !stack[level % 2].isEmpty {
                    let nextLevel = (level + 1) % 2
                    
                    let node = stack[level % 2].popLast()
                    if let node = node {
                        
                        if level >= traversal.endIndex { traversal.append([]) }
                        traversal[level].append(node.val)
                        
                        switch nextLevel {
                        case 0:     //right to left
                            if let r = node.right { stack[nextLevel].append(r) }
                            if let l = node.left { stack[nextLevel].append(l) }
                        default:    //left to right
                            if let l = node.left { stack[nextLevel].append(l) }
                            if let r = node.right { stack[nextLevel].append(r) }
                            
                        }
                    }
                    if stack[level % 2].isEmpty {
                        level += 1
                    }
                }
            }
            return traversal
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeBuilder.buildTreeWithNodes([3,9,20,nil,nil,15,7])
        BinaryTreePrinter.print(root!)
        
        
        print(Solution().zigzagLevelOrder(root))
        print(Solution2().zigzagLevelOrder(root))
    }
}
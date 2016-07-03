//
//  q102-binary-tree-level-order-traversal.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/binary-tree-level-order-traversal/
//  Category* :  BinaryTree BFS
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a binary tree, return the level order traversal of its nodes' values.
 * (ie, from left to right, level by level).
 *
 * For example:
 * Given binary tree {3,9,20,nil,nil,15,7},
 *
 *     3
 *    / \
 *   9  20
 *     /  \
 *    15   7
 *
 * return its level order traversal as:
 *
 * [
 *   [3],
 *   [9,20],
 *   [15,7]
 * ]
 ***********************************************************************************/


import Foundation

struct q102 {
    
    class Solution {
        func levelOrder(root: TreeNode?) -> [[Int]] {
            var traversal: [[Int]] = []
            if let root = root
            {
                var queue: [(TreeNode,Int)] = [(root,0)]
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
            return traversal
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeBuilder.buildTreeWithNodes([3,9,20,nil,nil,15,7])
        BinaryTreePrinter.print(root!)
        
        print(Solution().levelOrder(root))
    }
}
//
//  q107-binary-tree-level-order-traversal-ii.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
//  Category* :  BinaryTree BFS
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a binary tree, return the bottom-up level order traversal of its nodes' values.
 * (ie, from left to right, level by level from leaf to root).
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
 * return its bottom-up level order traversal as:
 *
 * [
 *   [15,7],
 *   [9,20],
 *   [3]
 * ]
 ***********************************************************************************/


import Foundation

struct q107 {
    
    class Solution {
        func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
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
                    head = (head + 1)
                }
                
            }
            return traversal.reversed()
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeHelper.buildTree(withNodes: [3,9,20,nil,nil,15,7])
        print(root)
        print(Solution().levelOrderBottom(root))
    }
}

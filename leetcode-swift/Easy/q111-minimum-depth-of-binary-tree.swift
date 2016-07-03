//
//  q111-minimum-depth-of-binary-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/minimum-depth-of-binary-tree/
//  Category* :  BinaryTree BFS
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a binary tree, find its minimum depth.
 *
 * The minimum depth is the number of nodes along the shortest path from the root node
 * down to the nearest leaf node.
 *
 **********************************************************************************/


import Foundation

struct q111 {
    
    class Solution {
        func minDepth(root: TreeNode?) -> Int {
            if let root = root
            {
                var queue: [(TreeNode,Int)] = [(root,1)]
                var head = queue.startIndex, tail = queue.endIndex
                while head < tail {
                    
                    let (node, height) = queue[head]
                    var isLeaf = true
                    if let l = node.left {
                        isLeaf = false
                        queue.append((l, height + 1))
                    }
                    if let r = node.right {
                        isLeaf = false
                        queue.append((r, height + 1))
                    }
                    if isLeaf {
                        return height
                    }
                    tail = queue.endIndex
                    head = head.successor()
                }
                
            }
            return 0
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeBuilder.buildTreeWithNodes([3,9,20,nil,nil,15,7])
        BinaryTreePrinter.print(root!)
        
        print(Solution().minDepth(root))
    }
}
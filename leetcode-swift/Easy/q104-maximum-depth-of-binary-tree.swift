//
//  q104-maximum-depth-of-binary-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/maximum-depth-of-binary-tree/
//  Category* :  BinaryTree RecursiveAlgorithm
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com

/**********************************************************************************
 *
 * Given a binary tree, find its maximum depth.
 *
 * The maximum depth is the number of nodes along the longest path from the root node
 * down to the farthest leaf node.
 *
 **********************************************************************************/


import Foundation

struct q104 {
    
    class Solution {
        func maxDepth(root: TreeNode?) -> Int {
            if root == nil {
                return 0
            } else {
                return 1 + max(maxDepth(root!.left), maxDepth(root!.right))
            }
        }
        
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeBuilder.buildTreeWithNodes([1,2,3,4,nil,6,7,8,nil,10,nil,nil,nil,14,15])

        BinaryTreePrinter.print(root!)
        
        print(Solution().maxDepth(root))
    }
}
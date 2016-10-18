//
//  q100-same-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/same-tree/
//  Category* :  BinaryTree RecursiveAlgorithm
//
//  Created by Tianyu Wang on 16/6/28.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given two binary trees, write a function to check if they are equal or not.
 *
 * Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 *
 *
 **********************************************************************************/


import Foundation

struct q100 {
    
    class Solution {
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p != nil && q != nil {
                return p!.val == q!.val && isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
            } else {
                return p == nil && q == nil
            }
        }
    }
    
    static func getSolution() -> Void {
        let tree1 = BinaryTreeHelper.buildTree(withNodes: [1,2,3,4,5,6,7,nil,nil,10,11])
        let tree2 = BinaryTreeHelper.buildTree(withNodes: [1,2,3,4,nil,6,7,8,nil,10,11])
        let tree3 = BinaryTreeHelper.buildTree(withNodes: [1,2,3,4,5,6,7,8,9,10,11])
        let tree4 = BinaryTreeHelper.buildTree(withNodes: [1,2,3,4,5,6,7,8,9,10,11])
        
        print(Solution().isSameTree(tree1, tree2))
        print(Solution().isSameTree(tree3, tree4))
    }
}

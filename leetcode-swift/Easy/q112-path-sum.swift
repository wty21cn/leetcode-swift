//
//  q112-path-sum.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/path-sum/
//  Category* :  DFS
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a binary tree and a sum, determine if the tree has a root-to-leaf path
 * such that adding up all the values along the path equals the given sum.
 *
 * For example:
 * Given the below binary tree and sum = 22,
 *
 *               5
 *              / \
 *             4   8
 *            /   / \
 *           11  13  4
 *          /  \      \
 *         7    2      1
 *
 * return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 *
 **********************************************************************************/

/* 
 
 DFS
 
 takecare that the path must be a root-to-leaf path and the node.val may be negetive
 
 */


import Foundation

struct q112 {
    
    class Solution {
        
        func dfs(_ node: TreeNode?, currentSum: Int, sum: Int) -> Bool {
            if let node = node  {
                
                let currentSum = currentSum + node.val
                
                let lResult = dfs(node.left, currentSum: currentSum, sum: sum)
                let rResult = dfs(node.right, currentSum: currentSum, sum: sum)
                
                switch (node.left, node.right) {
                case (nil,nil):
                    return lResult && rResult
                case (nil, _):
                    return rResult
                case (_, nil):
                    return lResult
                case (_, _):
                    return lResult || rResult
                }
                
                
            } else {
                return currentSum == sum
            }
        }
        
        func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
            if let root = root {
                return dfs(root, currentSum: 0, sum: sum)
            } else {
                return false
            }
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeHelper.buildTree(withNodes: [5,4,8,11,nil,13,4,7,2,nil,1])
        print(root ?? "")
        
        print(Solution().hasPathSum(root, 22))
        print(Solution().hasPathSum(root, 9))
    }
}

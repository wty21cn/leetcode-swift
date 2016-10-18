//
//  q110-balanced-binary-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/balanced-binary-tree/
//  Category* :  BinaryTree DFS
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


import Foundation

struct q110 {
    
    class Solution {
        
        func isNodeBalanced(_ node: TreeNode?) -> (Bool,Int) {
            if let node = node {
                let (isLeftBalanced, leftHeight) = isNodeBalanced(node.left)
                if !isLeftBalanced {
                    return (false, 0)
                }
                
                let (isRightBalanced, rightHeight) = isNodeBalanced(node.right)
                if !isRightBalanced {
                    return (false, 0)
                }
                
                if abs(leftHeight - rightHeight) <= 1 {
                    return (true, max(leftHeight, rightHeight) + 1)
                } else {
                    return (false, 0)
                }
                
            } else {
                return (true, 0)
            }
            
        }
        
        func isBalanced(_ root: TreeNode?) -> Bool {
            
            return isNodeBalanced(root).0
            
        }
    }

    static func getSolution() -> Void {
        let root = BinaryTreeHelper.buildTree(withNodes: [1,2,3,4,5,6,7,8])
        print(root)
        print(Solution().isBalanced(root))
    }
}

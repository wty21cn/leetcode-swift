//
//  q226-invert-binary-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/invert-binary-tree/
//  Category* :  BinaryTree RecursiveAlgorithm
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Invert a binary tree.
 *      4
 *    /   \
 *   2     7
 *  / \   / \
 * 1   3 6   9
 *
 * to
 *      4
 *    /   \
 *   7     2
 *  / \   / \
 * 9   6 3   1
 *
 * Trivia:
 * This problem was inspired by this original tweet by Max Howell:
 * (https://twitter.com/mxcl/status/608682016205344768)
 *
 *  | Google: 90% of our engineers use the software you wrote (Homebrew),
 *  | but you can’t invert a binary tree on a whiteboard so fuck off.
 *
 **********************************************************************************/


import Foundation

struct q226 {
    
    class Solution {
        func invertTree(_ root: TreeNode?) -> TreeNode? {
            if let node = root {
                invertTree(node.left)
                invertTree(node.right)
                
                (node.left, node.right) = (node.right, node.left)
            }
            return root
        }
    }
    
    static func getSolution() -> Void {
        let root = TreeNode(0)
        root.left = TreeNode(1)
        root.left!.left = TreeNode(2)
        root.left!.right = TreeNode(2)
        root.left!.right!.right = TreeNode(3)
        
        print(Solution().invertTree(root))
    }
}

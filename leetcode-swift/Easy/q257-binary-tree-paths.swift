//
//  q257-binary-tree-paths.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/binary-tree-paths/
//  Category* :  BinaryTree DFS
//
//  Created by Tianyu Wang on 16/7/6.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/***************************************************************************************
 *
 * Given a binary tree, return all root-to-leaf paths.
 *
 * For example, given the following binary tree:
 *
 *    1
 *  /   \
 * 2     3
 *  \
 *   5
 *
 * All root-to-leaf paths are:
 * ["1->2->5", "1->3"]
 *
 * Credits:
 * Special thanks to @jianchao.li.fighter for adding this problem and creating all test
 * cases.
 *
 ***************************************************************************************/


import Foundation

struct q257 {
    
    class Solution {
        var treePaths = [String]()
    
        func DFS(node node: TreeNode?, path: String) -> Void {
            
            if let node = node {
                
                if node.left == nil && node.right != nil {
                    treePaths.append(path + "->\(node.val)")
                } else {
                    if node.left != nil {
                        DFS(node: node.left, path: path + "->\(node.val)")
                    }
                    if node.right != nil {
                        DFS(node: node.right, path: path + "->\(node.val)")
                    }
                }
            }
        }
        
        func binaryTreePaths(root: TreeNode?) -> [String] {
            if  let root = root {
                DFS(node: root, path: "\(root.val)")
            }
            return treePaths
        }
    }
    
    static func getSolution() -> Void {
        
        let root = BinaryTreeBuilder.buildTreeWithNodes([1,2,3,4,5,6,7,8,9,10])
        
        print(root)
        print(Solution().binaryTreePaths(root))
    }
}
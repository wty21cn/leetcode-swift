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


import Foundation

struct q257 {
    
    class Solution {
        var treePaths = [String]()
    
        func DFS(node node: TreeNode?, path: String) -> Void {
            
            if let node = node {
                
                switch (node.left, node.right) {
                case (nil,nil):
                    treePaths.append(path + "->\(node.val)")
                case (_, nil):
                    DFS(node: node.left, path: path + "->\(node.val)")
                case (nil, _):
                    DFS(node: node.right, path: path + "->\(node.val)")
                case (_, _):
                    DFS(node: node.left, path: path + "->\(node.val)")
                    DFS(node: node.right, path: path + "->\(node.val)")
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
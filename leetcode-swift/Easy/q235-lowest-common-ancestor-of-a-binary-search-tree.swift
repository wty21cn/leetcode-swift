//
//  q235-lowest-common-ancestor-of-a-binary-search-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
//  Category* :  BinaryTree BinarySearchTree
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com

/**********************************************************************************
 *
 * Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given
 * nodes in the BST.
 *
 * According to the definition of LCA on Wikipedia: “The lowest common ancestor is
 * defined between two nodes v and w as the lowest node in T that has both v and w as
 * descendants (where we allow a node to be a descendant of itself).”
 *
 *         _______6______
 *        /              \
 *     ___2__          ___8__
 *    /      \        /      \
 *    0      _4       7       9
 *          /  \
 *          3   5
 *
 * For example, the lowest common ancestor (LCA) of nodes 2 and 8 is 6. Another example
 * is LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according
 * to the LCA definition.
 *
 *
 **********************************************************************************/


import Foundation

struct q235 {
    
    class Solution2 {
        func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
            var node: TreeNode? = root
            while node != nil {
                if node!.val < p.val && node!.val < q.val {
                    node = node!.right
                } else if node!.val > p.val && node!.val > q.val {
                    node = node!.left
                } else {
                    return node!
                }
            }
            return node!
        }
    }
    
    class Solution {
        func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
            
            let result: (numFound: Int, lca: TreeNode?) = findLCA(root, p, q)
            return result.lca!
            
        }
        
        fileprivate func findLCA(_ node: TreeNode, _ p: TreeNode, _ q: TreeNode) -> (Int, TreeNode?) {
            
            var totalNum = 0
            if node.val == p.val || node.val == q.val {
                if p.val == q.val {
                    return (2, node)
                } else {
                    totalNum += 1
                }
            }
            
            var result: (numFound: Int, lca: TreeNode?) = (0, nil)
            if let rSub = node.right {
                result = findLCA(rSub, p, q)
                if result.numFound == 2 {
                    return result
                } else {
                    totalNum += result.numFound
                }
            }
            
            if totalNum == 2 {
                return (totalNum, node)
            }
            
            if let lSub = node.left {
                result = findLCA(lSub, p, q)
                if result.numFound == 2 {
                    return result
                } else {
                    totalNum += result.numFound
                }
            }
            
            if totalNum == 2 {
                return (totalNum, node)
            }
            
            return (totalNum, nil)
            
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeHelper.buildTree(withNodes: [10,5,14,1,8,12,15,nil,4,7,nil,11,13,nil,nil,nil,nil,2])
        let p = TreeNode(1), q = TreeNode(8)
        
        print(root)
        
        print(Solution2().lowestCommonAncestor(root!, p, q).val)
    }
}

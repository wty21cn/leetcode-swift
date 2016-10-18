//
//  q101-symmetric-tree.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/symmetric-tree/
//  Category* :  BinaryTree BFS DFS
//
//  Created by Tianyu Wang on 16/7/3.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 *
 * For example, this binary tree is symmetric:
 *
 *     1
 *    / \
 *   2   2
 *  / \ / \
 * 3  4 4  3
 *
 * But the following is not:
 *
 *     1
 *    / \
 *   2   2
 *    \   \
 *    3    3
 *
 * Note:
 * Bonus points if you could solve it both recursively and iteratively.
 **********************************************************************************/

import Foundation

struct q101 {
    
    class Solution {
        func isSymmetric(_ root: TreeNode?) -> Bool {
            if let root = root {
                var queue: [[TreeNode]]
                if let l = root.left, let r = root.right {
                    if l.val == r.val {
                        queue = [[l,r],[]]
                    } else {
                        return false
                    }
                } else if root.left != nil || root.right != nil {
                    return false
                } else {
                    return true
                }
                
                var level = 0
                var next = 1
                
                while !queue[level].isEmpty {
                    var lIndex = 0, rIndex = 1
                    queue[next] = []
                    while rIndex < queue[level].endIndex {
                        let l = queue[level][lIndex]
                        let r = queue[level][rIndex]
                        
                        if let ll = l.left, let rr = r.right {
                            if ll.val == rr.val {
                                queue[next].append(ll)
                                queue[next].append(rr)
                            } else {
                                return false
                            }
                        } else if l.left != nil || r.right != nil {
                            return false
                        }
                        
                        if let lr = l.right, let rl = r.left {
                            if lr.val == rl.val {
                                queue[next].append(lr)
                                queue[next].append(rl)
                            } else {
                                return false
                            }
                        } else if l.right != nil || r.left != nil {
                            return false
                        }
                        
                        lIndex += 2
                        rIndex += 2
                    }
                    
                    level = next
                    next = (next + 1) % 2
                }
                return true
            } else {
                return true
            }
        }
    }
    
    class SolutionRecursively {
        
        func isSymmetric(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
            switch (l,r) {
            case let (l?,r?):
                return l.val == r.val && isSymmetric(l.left, r.right) && isSymmetric(l.right, r.left)
            case (nil,nil):
                return true
            default:
                return false
            }
            
        }
        
        func isSymmetric(_ root: TreeNode?) -> Bool {
            return isSymmetric(root?.left, root?.right)
        }
    }
    
    static func getSolution() -> Void {
        let root = BinaryTreeHelper.buildTree(withNodes: [6,82,82,nil,53,53,nil,-58,nil,nil,-58,nil,-85,-85,nil,-9,nil,nil,-9,nil,48,48,nil,33,nil,nil,33,81,nil,nil,81,5,nil,nil,5,61,nil,nil,61,nil,9,9,nil,91,nil,nil,91,72,7,7,72,89,nil,94,nil,nil,94,nil,89,-27,nil,-30,36,36,-30,nil,-27,50,36,nil,-80,34,nil,nil,34,-80,nil,36,50,18,nil,nil,91,77,nil,nil,95,95,nil,nil,77,91,nil,nil,18,-19,65,nil,94,nil,-53,nil,-29,-29,nil,-53,nil,94,nil,65,-19,-62,-15,-35,nil,nil,-19,43,nil,-21,nil,nil,-21,nil,43,-19,nil,nil,-35,-15,-62,86,nil,nil,-70,nil,19,nil,55,-79,nil,nil,-96,-96,nil,nil,-79,55,nil,19,nil,-70,nil,nil,86,49,nil,25,nil,-19,nil,nil,8,30,nil,82,-47,-47,82,nil,30,8,nil,nil,-19,nil,25,nil,49])
        print(root)
        
        print(Solution().isSymmetric(root))
        print(SolutionRecursively().isSymmetric(root))
    }
}

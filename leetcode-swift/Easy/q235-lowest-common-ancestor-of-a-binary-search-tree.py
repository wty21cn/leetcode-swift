#! _*_encoding:utf-8_*_
'''
  q235-lowest-common-ancestor-of-a-binary-search-tree.py
  leetcode-swift
  Source*   :  https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
  Category* :  BinaryTree BinarySearchTree

  Created by Tianyu Wang on 16/6/29.
  Github    :  http://github.com/wty21cn
  Website   :  http://wty.im
  Linkedin  :  https://www.linkedin.com/in/wty21cn
  Mail      :  mailto:wty21cn@gmail.com
'''

'''
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
'''

class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution(object):
    def lowestCommonAncestor(self, root, p, q):
        """
        :type root: TreeNode
        :type p: TreeNode
        :type q: TreeNode
        :rtype: TreeNode
        """
        result =  self.findLCA(root, p, q)
        return result[1]


    def findLCA(self, node, p, q):
    	"""
        :type root: TreeNode
        :type p: TreeNode
        :type q: TreeNode
        :rtype: (Int, TreeNode)
        """
        total_number = 0
        if node.val == p.val or node.val == q.val:
        	if p.val == q.val:
        		return (2, node)
        	total_number += 1
        if node.left:
        	result = self.findLCA(node.left, p, q)
        	if result[0] == 2:
        		return result
        	else:
        		total_number += result[0]

        if total_number == 2:
        	return (2, node)

        if node.right:
        	result = self.findLCA(node.right, p, q)
        	if result[0] == 2:
        		return result
        	else:
        		total_number += result[0]

        if total_number == 2:
        	return (2, node)

        return (total_number, None)
     

if __name__ == "__main__":
	root = TreeNode(2)
	root.left = TreeNode(1)


	print(Solution().lowestCommonAncestor(root, TreeNode(1), TreeNode(2)).val)
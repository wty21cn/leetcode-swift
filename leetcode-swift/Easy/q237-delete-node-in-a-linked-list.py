#! _*_encoding:utf-8_*_
'''
  q237-delete-node-in-a-linked-list.py
  leetcode-swift
  Source*   :  https://leetcode.com/problems/delete-node-in-a-linked-list/
  Category* :  LinkedList
  
  Created by Tianyu Wang on 16/6/29.
  Github    :  http://github.com/wty21cn
  Website   :  http://wty.im
  Linkedin  :  https://www.linkedin.com/in/wty21cn
  Mail      :  mailto:wty21cn@gmail.com
'''

'''
/********************************************************************************** 
 * 
 * Write a function to delete a node (except the tail) in a singly linked list, given 
 * only access to that node.
 * 
 * Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with 
 * value 3, the linked list should become 1 -> 2 -> 4 after calling your function.
 * 
 **********************************************************************************/
'''


class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def deleteNode(self, node):
        """
        :type node: ListNode
        :rtype: void Do not return anything, modify node in-place instead.
        """
        if node != None and node.next != None:
            node.val = node.next.val
            node.next = node.next.next


if __name__ == "__main__":
    print(Solution())
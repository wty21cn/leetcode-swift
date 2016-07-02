//
//  q237-delete-node-in-a-linked-list.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/delete-node-in-a-linked-list/
//  Category* :  LinkedList
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Write a function to delete a node (except the tail) in a singly linked list, given
 * only access to that node.
 *
 * Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with
 * value 3, the linked list should become 1 -> 2 -> 4 after calling your function.
 *
 **********************************************************************************/


import Foundation

struct q237 {
    
    class Solution {
        func deleteNode(node: ListNode) -> Void {
            if let next = node.next {
                node.val = next.val
                node.next = next.next
            }
        }
    }
    
    static func getSolution() -> Void {
        print(Solution())
    }
}
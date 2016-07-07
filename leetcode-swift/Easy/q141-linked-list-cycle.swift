//
//  q141-linked-list-cycle.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/linked-list-cycle/
//  Category* :  LinkedList
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a linked list, determine if it has a cycle in it.
 *
 * Follow up:
 * Can you solve it without using extra space?
 *
 *
 **********************************************************************************/

/* 
 Use Two pointers to travel through this linked list.
    1.fastPtr and slowPtr start from the head
    2.The fastPtr will move two nodes by one step
    3.The slowPtr will move one node by one step
 
 if this linked list has a cycle, these two pointer will meet again
 */

import Foundation

struct q141 {
    
    class Solution {
        func hasCycle(head: ListNode?) -> Bool {
            
            if head == nil { return false }
            
            var fastPtr = head?.next?.next
            var slowPtr = head?.next
            
            while fastPtr != nil && slowPtr != nil {
                if fastPtr === slowPtr {
                    return true
                } else {
                    fastPtr = fastPtr?.next?.next
                    slowPtr = slowPtr?.next
                }
            }
            return false
        }
    }
    
    static func getSolution() -> Void {
        
        let head = LinkedListHelper.buildLinkedList(withNodes: [1,2,3,4,5])
        head?.next?.next?.next?.next?.next = head?.next?.next?.next
        
        print(Solution().hasCycle(head))
    }
}
//
//  q019-remove-nth-node-from-end-of-list.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/remove-nth-node-from-end-of-list/
//  Category* :  LinkedList TwoPointers
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a linked list, remove the nth node from the end of list and return its head.
 *
 * For example,
 *
 *    Given linked list: 1->2->3->4->5, and n = 2.
 *
 *    After removing the second node from the end, the linked list becomes 1->2->3->5.
 *
 * Note:
 * Given n will always be valid.
 * Try to do this in one pass.
 *
 **********************************************************************************/


import Foundation

struct q19 {
    
    class Solution {
        func removeNthFromEnd(head: ListNode?, _ n: Int) -> ListNode? {
            if head == nil { return nil }
            
            var fastPtr = head, slowPtr = head
            for _ in 1...n {
                fastPtr = fastPtr?.next
            }
            
            if fastPtr == nil { return head!.next }
            
            while fastPtr?.next != nil {
                fastPtr = fastPtr!.next
                slowPtr = slowPtr!.next
            }
            
            slowPtr!.next = slowPtr!.next!.next
            return head
        }
    }
    
    static func getSolution() -> Void {
        let head = LinkedListHelper.buildLinkedList(withNodes: [1,2,3,4,5,6,7])
        print(Solution().removeNthFromEnd(head, 1))
    }
}
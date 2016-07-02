//
//  q206-reverse-linked-list.swift
//  leetcode-swift
//  Source    :  https://leetcode.com/problems/reverse-linked-list/
//  Category* :  LinkedList TwoPointers
//
//  Created by Tianyu Wang on 16/6/27.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Reverse a singly linked list.
 *
 * click to show more hints.
 *
 * Hint:
 * A linked list can be reversed either iteratively or recursively. Could you implement both?
 *
 *
 **********************************************************************************/


import Foundation

struct q206 {
    
    class Solution {
        func reverseList(head: ListNode?) -> ListNode? {
            
            return reverseListRecursively(head)
            
        }
        
        func reverseListRecursively(head: ListNode?) -> ListNode? {
            if let head = head {
                
                if head.next == nil {
                    return head
                }
                
                let reversedListHead = reverseListRecursively(head.next)
                
                head.next?.next = head
                head.next = nil
                
                return reversedListHead
            } else {
                return nil
            }
        }
        
    }
    
    class Solution2 {
        
        func reverseList(head: ListNode?) -> ListNode? {
            return reverseListInteratively(head)
        }
        
        func reverseListInteratively(head: ListNode?) -> ListNode? {
            var head = head
            var n: ListNode? = head?.next
            var p: ListNode? = nil
            while head?.next != nil {
                
                head!.next = p
                p = head
                head = n
                n = head?.next
                
            }
            head?.next = p
            return head
        }
    }
    
    static func getSolution() -> Void {
        let head = LinkedListBuilder.buildLinkedListWithNodes([1,2])
        LinkedListPrinter.print(head!)
        
        let reversedListHead = Solution2().reverseList(head!)
        LinkedListPrinter.print(reversedListHead!)
    }
}
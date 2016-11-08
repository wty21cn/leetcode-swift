//
//  q160-intersection-of-two-linked-lists.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/intersection-of-two-linked-lists/
//  Category* :  LinkedList
//
//  Created by Tianyu Wang on 16/7/5.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Write a program to find the node at which the intersection of two singly linked lists begins.
 *
 * For example, the following two linked lists:
 *
 *
 *    A:          a1 → a2
 *                       ↘
 *                         c1 → c2 → c3
 *                       ↗
 *    B:     b1 → b2 → b3
 *
 * begin to intersect at node c1.
 *
 * Notes:
 *
 * If the two linked lists have no intersection at all, return null.
 * The linked lists must retain their original structure after the function returns.
 * You may assume there are no cycles anywhere in the entire linked structure.
 * Your code should preferably run in O(n) time and use only O(1) memory.
 *
 **********************************************************************************/


import Foundation

struct q160 {
    
    class Solution {
        
        func proceedHead(_ head: ListNode?, step: Int) -> ListNode? {
            var head = head, step = step
            while step > 0 {
                head = head?.next
                step -= 1
            }
            return head
        }
        
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            
            if headA == nil || headB == nil { return nil }
            
            var headA = headA, headB = headB
            
            let lengthA = headA!.length
            let lengthB = headB!.length
            headA = proceedHead(headA, step: max(lengthA, lengthB) - lengthB)
            headB = proceedHead(headB, step: max(lengthA, lengthB) - lengthA)
            
            while headA != nil && headB != nil {
                if headA === headB {
                    return headA
                } else {
                    headA = headA!.next
                    headB = headB!.next
                }
            }
            return nil
        }
    }
    
    static func getSolution() -> Void {
        var headA = LinkedListHelper.buildLinkedList(withNodes: [1,2,3,7,8,9])
        var headB = LinkedListHelper.buildLinkedList(withNodes: [4,5,6])
        headB?.next?.next?.next = headA?.next?.next?.next
        print(headA ?? "")
        print(headB ?? "")
        
        print(Solution().getIntersectionNode(headA, headB) ?? "")
        
        headA = LinkedListHelper.buildLinkedList(withNodes: [1,2,3,7,8,9])
        headB = headA?.next?.next
        print(headA ?? "")
        print(headB ?? "")
        
        print(Solution().getIntersectionNode(headA, headB) ?? "")
        
        headA = LinkedListHelper.buildLinkedList(withNodes: [1,2,3,7,8,9])
        headB = LinkedListHelper.buildLinkedList(withNodes: [4,5,6])
        print(headA ?? "")
        print(headB ?? "")
        
        print(Solution().getIntersectionNode(headA, headB) ?? "")
        
        print(Solution().getIntersectionNode(nil, nil) ?? "")
    }
}

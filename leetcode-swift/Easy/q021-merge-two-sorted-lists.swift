//
//  q021-merge-two-sorted-lists.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/merge-two-sorted-lists/
//  Category* :  LinkedList TwoPointers
//
//  Created by Tianyu Wang on 16/7/1.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com



/**********************************************************************************
 *
 * Merge two sorted linked lists and return it as a new list. The new list should be
 * made by splicing together the nodes of the first two lists.
 *
 **********************************************************************************/


import Foundation

struct q021 {
    
    class Solution {
        func mergeTwoLists(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            
            if l1 == nil { return l2 }
            if l2 == nil { return l1 }
            
            let head = l1!.val < l2!.val ? l1 : l2    // point to the head of merged list
            var tmp: ListNode? = nil                  // point to previous selected nodes
            var l1 = l1, l2 = l2
            
            while l1 != nil && l2 != nil {
                if l1!.val < l2!.val {
                    tmp?.next = l1
                    tmp = l1
                    l1 = l1!.next
                } else {
                    tmp?.next = l2
                    tmp = l2
                    l2 = l2!.next
                }
            }
            tmp?.next = l1 != nil ? l1 : l2
            return head
        }
    }

    static func getSolution() -> Void {
        
        var l1 = LinkedListBuilder.buildLinkedListWithNodes([1,5,8,9,13])
        var l2 = LinkedListBuilder.buildLinkedListWithNodes([0,2,3,6,11,14])
        
        LinkedListPrinter.print(Solution().mergeTwoLists(l1,l2)!)
        
        l1 = LinkedListBuilder.buildLinkedListWithNodes([1,2,3,4,5])
        l2 = LinkedListBuilder.buildLinkedListWithNodes([1,2,3,4,5,6])
        LinkedListPrinter.print(Solution().mergeTwoLists(l1, l2)!)
        
        
        l1 = LinkedListBuilder.buildLinkedListWithNodes([1,2,3,4,5])
        l2 = nil
        LinkedListPrinter.print(Solution().mergeTwoLists(l1, l2)!)
        
    }
}
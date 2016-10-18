//
//  q083-remove-duplicates-from-sorted-list.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/remove-duplicates-from-sorted-list/
//  Category* :  LinkedList
//
//  Created by Tianyu Wang on 16/6/29.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a sorted linked list, delete all duplicates such that each element appear only once.
 *
 * For example,
 * Given 1->1->2, return 1->2.
 * Given 1->1->2->3->3, return 1->2->3.
 *
 *
 **********************************************************************************/


import Foundation

struct q83 {
    
    class Solution {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            if var h = head {
                while h.next != nil {
                    if h.val == h.next!.val {
                        h.next = h.next!.next
                    } else {
                        h = h.next!
                    }
                }
            }
            
            return head
        }
    }
    
    static func getSolution() -> Void {
        let head = LinkedListHelper.buildLinkedList(withNodes: [1,1,3,4,4,5,5,6,6,7])
        print(head)
        print(Solution().deleteDuplicates(head))
    }
}

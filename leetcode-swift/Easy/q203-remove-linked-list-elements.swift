//
//  q203-remove-linked-list-elements.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/remove-linked-list-elements/
//  Category* :  LinkedList
//
//  Created by Tianyu Wang on 16/7/6.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Remove all elements from a linked list of integers that have value val.
 *
 * Example
 * Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6,  val = 6
 * Return: 1 --> 2 --> 3 --> 4 --> 5
 *
 * Credits:Special thanks to @mithmatt for adding this problem and creating all test cases.
 *
 **********************************************************************************/


import Foundation

struct q203 {
    
    class Solution {
        func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            let headPtr = ListNode(0)
            headPtr.next = head
            var node: ListNode? = headPtr
            
            while node != nil {
                if let next = node!.next {
                    if next.val == val {
                        node!.next = next.next
                    } else {
                        node = node!.next
                    }
                } else {
                    node = node!.next
                }
            }
            
            return headPtr.next
        }
    }
    
    static func getSolution() -> Void {
        let head = LinkedListHelper.buildLinkedList(withNodes: [1,2,3,1,1,2,1,2,3,1])
        print(head ?? "")
        print(Solution().removeElements(head, 1) ?? "")
    }
}

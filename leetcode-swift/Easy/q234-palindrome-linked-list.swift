//
//  q234-palindrome-linked-list.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/palindrome-linked-list/
//  Category* :  LinkedList TwoPointers
//
//  Created by Tianyu Wang on 16/7/7.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Given a singly linked list, determine if it is a palindrome.
 *
 * Follow up:
 * Could you do it in O(n) time and O(1) space?
 *
 **********************************************************************************/


import Foundation

struct q234 {
    
    class Solution {
        func findHalfOfLink(head: ListNode?) -> ListNode? {
            var head = head
            var fastPtr = head
            while fastPtr?.next != nil {
                head = head!.next
                fastPtr = fastPtr!.next!.next
            }
            return head
        }
        
        func reverse(head: ListNode?) -> ListNode? {
            var head = head
            var p: ListNode? = nil
            var n: ListNode? = head?.next
            
            while head != nil {
                head!.next = p
                p = head
                head = n
                n = head?.next
            }
            return p
        }

        func isPalindrome(head: ListNode?) -> Bool{
            var halfHead = reverse(findHalfOfLink(head))
            var head = head
            
            while head != nil && halfHead != nil {
                guard head!.val == halfHead!.val else {
                    return false
                }
                head = head!.next
                halfHead = halfHead!.next
            }
            return true
        }
    }
    
    // This Solution will crash when the link is very long.
    class Solution_StackOverFlow {
        var ptr: ListNode?
        
        func isPalindromeUtil(node: ListNode) -> Bool {
            
            if let next = node.next {
                guard isPalindromeUtil(next) else {
                    return false
                }
            }
            
            guard ptr!.val == node.val else {
                return false
            }
            
            ptr = ptr!.next
            return true
        }
        
        func isPalindrome(head: ListNode?) -> Bool {
            
            if let head = head {
                ptr = head
                return isPalindromeUtil(head)
            } else {
                return true
            }
        }
    }
    static func getSolution() -> Void {
        let head = LinkedListBuilder.buildLinkedListWithNodes([1,1,2,1,1])
        print(head)
        print(Solution().isPalindrome(head))
    }
}
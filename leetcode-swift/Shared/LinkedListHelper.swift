//
//  LinkedListHelper.swift
//  leetcode-swift
//
//  Created by Tianyu Wang on 16/6/29.
//  Github   :  http://github.com/wty21cn
//  Website  :  http://wty.im
//  Linkedin :  https://www.linkedin.com/in/wty21cn
//  Mail     :  mailto:wty21cn@gmail.com

import Foundation

protocol ListNodePrintable {
    func presentation() -> String
    func successor() -> ListNodePrintable?
}


class LinkedListHelper {
    
    static func buildLinkedList(withNodes nodes: [Int]) -> ListNode? {
        var root: ListNode?
        var ln: ListNode?
        for node in nodes {
            if ln != nil {
                ln!.next = ListNode(node)
                ln = ln!.next
            } else {
                ln = ListNode(node)
                root = ln
            }
        }
        return root
    }
}

extension LinkedListHelper {
    fileprivate static let indent = "-->"
    
    static func getStructureDescription(forNode node: ListNodePrintable?) -> String {
        var description = ""
        if var node = node {
            while true  {
                description += node.presentation()
                if let n = node.successor() {
                    description += indent
                    node = n
                } else {
                    break
                }
            }
        } else {
            description = "nil"
        }
        return description
    }
}

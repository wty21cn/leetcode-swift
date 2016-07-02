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

class LinkedListBuilder {
    static func buildLinkedListWithNodes(nodes: [Int]) -> ListNode? {
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

class LinkedListPrinter {
    
    private static let indent = "-->"
    
    static func print(node: ListNodePrintable) -> Void {
        var node = node
        while true  {
            Swift.print(node.presentation(), terminator: "")
            if let n = node.successor() {
                Swift.print(indent, terminator: "")
                node = n
            } else {
                Swift.print("")
                return
            }
        }
    }
}
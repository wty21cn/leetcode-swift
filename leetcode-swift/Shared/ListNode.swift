//
//  ListNode.swift
//  leetcode-swift
//
//  Created by Tianyu Wang on 16/6/29.
//  Github   :  http://github.com/wty21cn
//  Website  :  http://wty.im
//  Linkedin :  https://www.linkedin.com/in/wty21cn
//  Mail     :  mailto:wty21cn@gmail.com

import Foundation

open class ListNode: ListNodePrintable, CustomStringConvertible {
    open var val: Int
    open var next: ListNode?
    open var length: Int {
        if let nextNode = next {
            return nextNode.length + 1
        } else {
            return 1
        }
    }
    
    public init(_ val: Int) {
            self.val = val
            self.next = nil
    }
    
//MARK: - ListNodePrintable Protocol
    
    func presentation() -> String {
        return "\(val)"
    }
    
    func successor() -> ListNodePrintable? {
        return next
    }
    
//MARK: - CustomStringConvertible Protocol {
    
    open var description: String {
        return LinkedListHelper.getStructureDescription(forNode: self)
    }
    
}

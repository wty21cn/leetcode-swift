//
//  TreeNode.swift
//  leetcode-swift
//
//  Created by Tianyu Wang on 16/6/29.
//  Github   :  http://github.com/wty21cn
//  Website  :  http://wty.im
//  Linkedin :  https://www.linkedin.com/in/wty21cn
//  Mail     :  mailto:wty21cn@gmail.com

import Foundation

class TreeNode: BinaryTreeNodePrintable, CustomStringConvertible {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
}
    
//MARK:- BinaryTreeNodePrintable Protocol
    
    func leftSubTree() -> BinaryTreeNodePrintable? {
        return left
    }
    
    func rightSubTree() -> BinaryTreeNodePrintable? {
        return right
    }
    
    func presentation() -> String {
        return "\(val)"
    }

//MARK: - CustomStringConvertible Protocol {
    
    var description: String {
        BinaryTreePrinter.print(self)
        return ""
    }
    
}
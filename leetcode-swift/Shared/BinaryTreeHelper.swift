//
//  BinaryTreePrinter.swift
//  leetcode-swift
//
//  Created by Tianyu Wang on 16/6/29.
//  Github   :  http://github.com/wty21cn
//  Website  :  http://wty.im
//  Linkedin :  https://www.linkedin.com/in/wty21cn
//  Mail     :  mailto:wty21cn@gmail.com

import Foundation

//MARK: - Helper Protocol

protocol BinaryTreeNodePrintable {
    func leftSubTree() -> BinaryTreeNodePrintable?
    func rightSubTree() -> BinaryTreeNodePrintable?
    func presentation() -> String
}

//MARK: - BinaryTreeBuilder

class BinaryTreeBuilder {
    
    static func buildTreeWithNodes(nodes: [Int?]) -> TreeNode? {
        let root = buildTree(withNodes: nodes, index: nodes.startIndex)
        return root
    }
    
    private static func buildTree(withNodes nodes: [Int?], index: Int) -> TreeNode? {
        if index < nodes.endIndex {
            if let nodeValue = nodes[index] {
                let node = TreeNode(nodeValue)
                node.left = buildTree(withNodes: nodes, index: index * 2 + 1)
                node.right = buildTree(withNodes: nodes, index: index * 2 + 2)
                return node
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}


//MARK: - BinaryTreePrinter

class BinaryTreePrinter {
    
    private static let indentStrVertical    = " │      "
    private static let indentStrBlank       = "        "
    private static let indentStrLine        = "───── "
    private static let indentStrRightChild  = " ┌"
    private static let indentStrLeftChild   = " └"
    
    static func print(root: BinaryTreeNodePrintable) -> Void {
        
        if let rc = root.rightSubTree() {
            printSubtree(rc, isRightSubtree: true, indent: "")
        }
        
        Swift.print(root.presentation())
        
        if let lc = root.leftSubTree() {
            printSubtree(lc, isRightSubtree: false, indent: "")
        }
        
    }
    
    private static func printSubtree(subtree: BinaryTreeNodePrintable, isRightSubtree: Bool, indent: String) -> Void {
        
        let leftSubtreeIndent = indent + (isRightSubtree ? indentStrVertical : indentStrBlank)
        let rightSubTreeIndent = indent + (isRightSubtree ? indentStrBlank : indentStrVertical)
        let fullIndent = indent + (isRightSubtree ? indentStrRightChild : indentStrLeftChild) + indentStrLine
        
        
        if let rc = subtree.rightSubTree() {
            printSubtree(rc, isRightSubtree: true, indent: rightSubTreeIndent)
        }
        
        Swift.print(fullIndent, terminator: "")
        Swift.print(subtree.presentation())
        
        if let lc = subtree.leftSubTree() {
            printSubtree(lc, isRightSubtree: false, indent: leftSubtreeIndent)
        }
    }
    
}


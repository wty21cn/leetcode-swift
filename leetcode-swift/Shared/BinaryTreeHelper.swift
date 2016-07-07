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

class BinaryTreeHelper {
    static func buildTree(withNodes nodes: [Int?]) -> TreeNode? {
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

extension BinaryTreeHelper {
    
    private static let indentStrVertical    = " │      "
    private static let indentStrBlank       = "        "
    private static let indentStrLine        = "───── "
    private static let indentStrRightChild  = " ┌"
    private static let indentStrLeftChild   = " └"
    
    static func getStructureDescription(forNode node: BinaryTreeNodePrintable?) -> String {
        var description = "\n"
        if let root = node {
            if let rc = root.rightSubTree() {
                description += getSubtreeStructureDescription(rc, isRightSubtree: true, indent: "")
            }
            
            description += root.presentation() + "\n"
            
            if let lc = root.leftSubTree() {
               description += getSubtreeStructureDescription(lc, isRightSubtree: false, indent: "")
            }
        } else {
            description = "nil"
        }
        return description
    }
    
    private static func getSubtreeStructureDescription(subtree: BinaryTreeNodePrintable, isRightSubtree: Bool, indent: String) -> String {
        
        var description = ""
        
        let leftSubtreeIndent = indent + (isRightSubtree ? indentStrVertical : indentStrBlank)
        let rightSubTreeIndent = indent + (isRightSubtree ? indentStrBlank : indentStrVertical)
        let fullIndent = indent + (isRightSubtree ? indentStrRightChild : indentStrLeftChild) + indentStrLine
        
        if let rc = subtree.rightSubTree() {
            description += getSubtreeStructureDescription(rc, isRightSubtree: true, indent: rightSubTreeIndent)
        }
        
        description += fullIndent + subtree.presentation() + "\n"
        
        if let lc = subtree.leftSubTree() {
            description += getSubtreeStructureDescription(lc, isRightSubtree: false, indent: leftSubtreeIndent)
        }
        return description
    }
    
}

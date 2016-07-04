//
//  q232-implement-queue-using-stacks.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/implement-queue-using-stacks/
//  Category* :  Queue Stack
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Implement the following operations of a queue using stacks.
 *
 * push(x) -- Push element x to the back of queue.
 *
 * pop() -- Removes the element from in front of queue.
 *
 * peek() -- Get the front element.
 *
 * empty() -- Return whether the queue is empty.
 *
 * Notes:
 *
 * You must use only standard operations of a stack -- which means only push to top,
 * peek/pop from top, size, and is empty operations are valid.
 * Depending on your language, stack may not be supported natively. You may simulate a
 * stack by using a list or deque (double-ended queue), as long as you use only
 * standard operations of a stack.
 * You may assume that all operations are valid (for example, no pop or peek operations
 * will be called on an empty queue).
 *
 **********************************************************************************/


import Foundation

struct q232 {
    
    class Queue {
        
        var stack: [Int] = []
        var tmpStack: [Int] = []
        
        
        func push(n: Int) -> Void {
            stack.append(n)
        }
        
        func pop() -> Int {
            
            while stack.count != 1 {
                tmpStack.append((stack.removeLast()))
            }
            
            let h = stack.removeLast()
            
            while tmpStack.count != 0 {
                stack.append(tmpStack.removeLast())
            }
            
            return h
        }
        
        func pick() -> Int {
            while stack.count != 1 {
                tmpStack.append((stack.removeLast()))
            }
            
            let h = stack.last
            
            while tmpStack.count != 0 {
                stack.append(tmpStack.removeLast())
            }
            
            return h!
            
        }
        
        func isEmpty() -> Bool {
            return stack.isEmpty
        }
    }
    
    static func getSolution() -> Void {
        
        let queue = Queue()
        queue.push(1); queue.push(2); queue.push(3); queue.push(4);
        print(queue.pop()); print(queue.pop()); print(queue.pop()); print(queue.pop());
        print(queue.isEmpty())
        
    }
}
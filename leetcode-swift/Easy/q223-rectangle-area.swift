//
//  q223-rectangle-area.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/rectangle-area/
//  Category* :  Geometry
//
//  Created by Tianyu Wang on 16/7/4.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Find the total area covered by two rectilinear rectangles in a 2D plane.
 * Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.
 *
 *                      Y
 *                      ^
 *                      |
 *                      |
 *                      |
 *                      |     (C,D):(3,4)
 *            +------------------+
 *            |         |        |
 *            |         |        |
 *            |         |        |               (G,H):(9,2)
 *            |         +----------------------------+
 *            |         |        |                   |
 *            |         |        |                   |
 *            |         |        |                   |
 *            +---------|--------+-------------------|---------> X
 *      (A,B):(-3,0)    |                            |
 *                      +----------------------------+
 *                  (E,F):(0,-1)
 *
 *
 *
 * Assume that the total area is never beyond the maximum possible value of int.
 *
 * Credits:Special thanks to @mithmatt for adding this problem, creating the above image and all test cases.
 *
 **********************************************************************************/


import Foundation

struct q223 {
    
    class Solution {
        
        class Rectangle {
            var bottomLeft: (x: Int, y: Int)!
            var topRight: (x: Int, y: Int)!
            
            init(bottomLeftX: Int, bottomLeftY: Int, topRightX: Int, topRightY: Int) {
                bottomLeft = (bottomLeftX, bottomLeftY)
                topRight = (topRightX, topRightY)
            }
            
            func intersectArea(rect: Rectangle) -> Int {
                let x = max(0, min(topRight.x, rect.topRight.x) - max(bottomLeft.x, rect.bottomLeft.x))
                let y = max(0, min(topRight.y, rect.topRight.y) - max(bottomLeft.y, rect.bottomLeft.y))
                return x * y
            }
            
            func area() -> Int {
                return (topRight.x - bottomLeft.x) * (topRight.y - bottomLeft.y)
            }
            
        }
        
        func computeArea(A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
            
            let rectA = Rectangle(bottomLeftX: A,bottomLeftY: B,topRightX: C,topRightY: D)
            let rectB = Rectangle(bottomLeftX: E,bottomLeftY: F,topRightX: G,topRightY: H)
            return rectA.area() + rectB.area() - rectA.intersectArea(rectB)
            
            
            
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().computeArea(0, 0, 2, 2, -1, -1, 1, 1))
    }
}
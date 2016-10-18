//
//  q121-best-time-to-buy-and-sell-stock.swift
//  leetcode-swift
//  Source*   :  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//  Category* :  DynamicProgramming
//
//  Created by Tianyu Wang on 16/6/30.
//  Github    :  http://github.com/wty21cn
//  Website   :  http://wty.im
//  Linkedin  :  https://www.linkedin.com/in/wty21cn
//  Mail      :  mailto:wty21cn@gmail.com


/**********************************************************************************
 *
 * Say you have an array for which the ith element is the price of a given stock on day i.
 *
 * If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock),
 * design an algorithm to find the maximum profit.
 *
 **********************************************************************************/

/* 
 Dynamic Programming
 
 you should remenber the minimum buying price(minBuyingPrice) before day i, and the maximum profit(maxProfit) you can get if you do nothing on day i.
 
 when considering the max profit you can get on day i, you can choose the following two options
 
    1.You can sell the stock, for the best, you can get prices[i] - minBuyingPrice
    2.You can do nothing, so you can get the privious maxProfit
 
 you should choose max(maxProfit, price - minBuyingPrice)
 
 when considering the days after day i, you should judge that whether day i is best day for buying stock by judging min(minBuyingPrice, price)
 
 */


import Foundation

struct q121 {
    
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            
            var minBuyingPrice = Int.max
            var maxProfit = 0
            for price in prices {
                maxProfit = max(maxProfit, price - minBuyingPrice)
                minBuyingPrice = min(minBuyingPrice, price)
            }
            return maxProfit
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().maxProfit([7,6,5,4,3,2,1]))
    }
}

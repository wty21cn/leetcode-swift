//
//  q122-best-time-to-buy-and-sell-stock-ii.swift
//  leetcode-swift
//  Source    :  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
//  Category* :  Greedy
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
 * Design an algorithm to find the maximum profit. You may complete as many transactions
 * as you like (ie, buy one and sell one share of the stock multiple times). However,
 * you may not engage in multiple transactions at the same time (ie, you must sell the
 * stock before you buy again).
 *
 **********************************************************************************/

/* 
 
 Greedy Solution
 
 In Stock Game, You should always buy shares at the lowest price and sell it at the highest price.
 Apparently In real world you don't know the future. But for this question you do.
 
 So Everytime you see the price of tomorrow is low than today, you sell it and buy again tomorrow.
 
 */


import Foundation

struct Q0122 {
    
    class Solution {
        func maxProfit(prices: [Int]) -> Int {
            
            var prices = prices
            prices.append(0)  //take care of the last day.
            
            var minBuyingPrice = prices.first
            var totalProfit = 0
            for index in prices.startIndex.successor()..<prices.endIndex {
                
                if prices[index] < prices[index.predecessor()] {
                    
                    totalProfit += (prices[index.predecessor()] - minBuyingPrice!)
                    minBuyingPrice = prices[index]
                    
                }
            }
            
            return totalProfit
            
        }
    }
    
    static func getSolution() -> Void {
        print(Solution().maxProfit([7,1,5,3,6,4]))
    }
}
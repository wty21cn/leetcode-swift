#! _*_encoding:utf-8_*_
'''
  q191-number-of-1-bits.py
  leetcode-swift
  Source    :  https://leetcode.com/problems/number-of-1-bits/
  Category* :  Math

  Created by Tianyu Wang on 16/6/29.
  Github    :  http://github.com/wty21cn
  Website   :  http://wty.im
  Linkedin  :  https://www.linkedin.com/in/wty21cn
  Mail      :  mailto:wty21cn@gmail.com
'''


'''
/**********************************************************************************
 *
 * Write a function that takes an unsigned integer and returns the number of ’1' bits it has
 * (also known as the Hamming weight).
 *
 * For example, the 32-bit integer ’11' has binary representation 00000000000000000000000000001011,
 * so the function should return 3.
 *
 * Credits:Special thanks to @ts for adding this problem and creating all test cases.
 *
 **********************************************************************************/
'''

''' 
  Normal Solution:
    while n != 0, see if the right first binary digit is 1 or 0 using n & 0b1, and then do binary right shift to n
  

  Fast Solution:
    while n != 0, do n & (n - 1) to eliminate the right first binary digit.
    Count the times of this process until n == 0
    
'''

class Solution(object):
    def hammingWeight(self, n):
        """
        :type n: int
        :rtype: int
        """
        num = 0
        while n != 0:
          n &= (n - 1)
          num += 1
        return num

if __name__ == "__main__":
  print(Solution().hammingWeight(30))

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        maxProfits = []

        for i, price in enumerate(prices):
            maxProfits.append(max(prices[i:]) - price)
        
        return max(maxProfits)
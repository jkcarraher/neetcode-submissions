class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount != 0 else { return 0 }
        var cache: [Int: Double] = [:]
        
        func dfs(_ currAmt: Int) -> Double {
            guard currAmt <= amount else { return Double.infinity }
            guard currAmt != amount else { return 0 }
            if cache[currAmt] != nil { return cache[currAmt]! }
            
            var ret: [Double] = []
            for c in coins{
                ret.append( 1+dfs(currAmt+c) )
            }
            let ans = ret.min()!
            
            cache[currAmt] = ans
            return ans
        }
        var ret: [Double] = []
        for c in coins{
            ret.append( 1+dfs(c) )
        }

        if ret.min()! == Double.infinity {
            return -1
        } else {
            return Int(ret.min()!)
        }
            

    }
}

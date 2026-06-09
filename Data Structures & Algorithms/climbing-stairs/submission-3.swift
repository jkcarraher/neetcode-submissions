class Solution {
    func climbStairs(_ n: Int) -> Int {
        // Remembers Repeated Work (Position: Num Ways to get there)
        var cache: [Int: Int] = [:]
        
        func dfs(_ pos: Int) -> Int {
            guard pos <= n else { return 0 }
            if pos == n { return 1 }
            let one: Int
            let two: Int
            if cache[pos+1] != nil { one = cache[pos+1]! } else { one = dfs(pos+1) }
            if cache[pos+2] != nil { two = cache[pos+2]! } else { two = dfs(pos+2) }

            cache[pos] = one+two
            return one + two
        }

        return dfs(0)

    }
}
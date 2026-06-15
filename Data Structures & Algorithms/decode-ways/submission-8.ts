class Solution {
    /**
     * @param {string} s
     * @return {number}
     */
    numDecodings(s: string): number {
        if (s.length == 0) { return 0 }
        let cache = {}

        function dfs(i: number) {
            if (i === s.length) { return 1 }
            if (s[i] == "0") { return 0 }
            if (i in cache) { return cache[i] }  
            
            let tmpSum = dfs(i+1)
            if (i+1 < s.length && (s[i] == "1" || (s[i] == "2" && s[i+1] <= "6"))) {
                tmpSum += dfs(i+2)
            } 
            cache[ i ] = tmpSum
            return tmpSum
        }

        return dfs(0)
    }
}

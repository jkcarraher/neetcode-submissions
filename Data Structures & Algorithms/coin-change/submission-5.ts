class Solution {
    /**
     * @param {number[]} coins
     * @param {number} amount
     * @return {number}
     */
    coinChange(coins: number[], amount: number): number {
        if ( amount === 0 ) { return 0 }
        var cache = {}
        function dfs(currAmt: number): number {
            if (currAmt > amount) { return Infinity }
            if (currAmt == amount) { return 0 }
            if (currAmt in cache) { return cache[currAmt]}

            let res: number[] = []
            for (let c of coins) {
                res.push( 1+dfs(currAmt+c) )
            }
            const ans = Math.min(...res)

            cache[currAmt] = ans
            return ans
        }

        let res: number[] = []
        for (let c of coins) {
            res.push( 1+dfs(c) )
        }
        const ans = Math.min(...res)

        if (ans === Infinity) {
            return -1
        } else {
            return ans
        }
    }
}

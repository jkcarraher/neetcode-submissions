class Solution {
    /**
     * @param {number} n
     * @return {number[]}
     */
    countBits(n: number): number[] {
        var retArr: number[] = []
        for (let num = 0; num <= n; num++) {
            var count = 0
            for (let i = 0; i < 32; i++) {
                let mask = 1 << i
                if ((num & mask) != 0) {
                    count += 1
                }
            }
            retArr.push(count)
        }
        return retArr
    }
}

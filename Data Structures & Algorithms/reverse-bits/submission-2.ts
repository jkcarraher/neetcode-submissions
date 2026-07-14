class Solution {
    /**
     * @param {number} n - a positive integer
     * @return {number} - a positive integer
     */
    reverseBits(n: number): number {
        var ret = 0
        for (let i = 0; i < 32; i++) {
            const bit = (n >>> i) & 1
            ret += bit << (31-i)
        }
        return ret >>> 0
    }
}

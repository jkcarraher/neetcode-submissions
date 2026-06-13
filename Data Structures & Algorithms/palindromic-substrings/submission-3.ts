class Solution {
    /**
     * @param {string} s
     * @return {number}
     */
    countSubstrings(s: string): number {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
            // Odd Case
            let r = i
            let l = i
            while (l >= 0 && r < s.length && s[l]===s[r]) {
                count+=1
                l-=1
                r+=1
            }
            // Even Case
            r = i + 1
            l = i
            while (l >= 0 && r < s.length && s[l]===s[r]) {
                count+=1
                l-=1
                r+=1
            }
        }

        return count;
    }
}

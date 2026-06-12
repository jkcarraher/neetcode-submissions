class Solution {
    /**
     * @param {string} s
     * @return {string}
     */
    longestPalindrome(s) {
        var retStr = ""

        for (var i = 0; i < s.length; i++ ) {
            // Odd case
            var l = i
            var r = i
            while ( l >= 0 && r < s.length && s[l] == s[r] ) {
                if ( s.slice(l, r+1).length > retStr.length ) {
                    retStr = s.slice(l, r+1)
                }
                r+=1
                l-=1
            }
            // Even case
            var l = i
            var r = i+1
            while ( l >= 0 && r < s.length && s[l] == s[r] ) {
                if ( s.slice(l, r+1).length > retStr.length ) {
                    retStr = s.slice(l, r+1)
                }
                r+=1
                l-=1
            }
        }

        return retStr
    }
}

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let s = Array(s)
        var maxStr: [Character] = []

        for i in 0..<s.count {
            // Odd length
            var l = i
            var r = i
            while l >= 0 && r < s.count && s[l] == s[r] {
                if (r-l+1) > maxStr.count {
                    maxStr = Array(s[l..<r+1])
                }
                l-=1
                r+=1
            }
            // Even length
            l = i
            r = i+1
            while l >= 0 && r < s.count && s[l] == s[r] {
                if (r-l+1) > maxStr.count {
                    maxStr = Array(s[l..<r+1])
                }
                l-=1
                r+=1
            }
        }
        return String(maxStr)
    }
}

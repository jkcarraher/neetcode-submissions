class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        for i in 0..<32 {
            let mask = 1 << i
            if n & mask != 0 {
                count += 1
            }
        }
        return count
    }
}

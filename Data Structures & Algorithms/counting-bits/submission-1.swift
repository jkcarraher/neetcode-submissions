class Solution {
    func countBits(_ n: Int) -> [Int] {
        var retArr: [Int] = []
        for num in 0...n {
            var count = 0
            for i in 0...31 {
                let mask = 1 << i
                if num & mask != 0 {
                    count+=1
                }
            }
            retArr.append(count)
        }
        return retArr
    }
}

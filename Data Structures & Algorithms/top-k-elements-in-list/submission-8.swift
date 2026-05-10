class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // [val:freq]
        var dict: [Int:Int] = [:]

        // O(n)
        for n in nums {
            dict[n, default: 0] += 1
        }

        // O(n) - build freq array
        var freq: [[Int]] = Array(repeating:[], count: nums.count+1)
        for e in dict {
            freq[e.value].append(e.key)
        }

        // 0(n)
        var i = nums.count
        var retArr: [Int] = []

        while retArr.count < k {
            while !freq[i].isEmpty && retArr.count < k{
                retArr.append(freq[i].popLast()!)
            }
            i-=1
        }

        return retArr
    }
}

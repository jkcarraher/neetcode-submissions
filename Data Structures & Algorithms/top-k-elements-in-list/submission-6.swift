class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int:Int] = [:]

        // O(n)
        for n in nums {
            dict[n, default: 0] += 1
        }

        // 0(nlogn)
        let matches = dict
            .sorted {$0.value > $1.value }
            .prefix(k)
            .map{$0.key}

        return matches
    }
}

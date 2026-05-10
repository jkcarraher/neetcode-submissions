class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int:Int] = [:]

        for n in nums {
            dict[n, default: 0] += 1
        }

        let matches = dict
            .sorted {$0.value > $1.value }
            .prefix(k)
            .map{$0.key}

        return matches
    }
}

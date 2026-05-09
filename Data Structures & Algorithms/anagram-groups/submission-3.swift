class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String:[String]] = [:]

        for s in strs {
            let sortedS = String(s.sorted())
            dict[sortedS, default: []].append(s)
        }

        return Array(dict.values)
    }
}

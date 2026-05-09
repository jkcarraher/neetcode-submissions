class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String:[String]] = [:]

        for s in strs {
            let sortedS = String(s.sorted())
            if dict[sortedS] != nil {
                dict[sortedS]!.append(s)
            } else {
                dict[sortedS] = [s]
            }
        }

        return Array(dict.values)
    }
}

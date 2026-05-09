class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [[Character:Int]:[String]] = [:]

        for s in strs {
            var tempDict: [Character:Int] = [:]
            for c in s {
                tempDict[c, default: 0] += 1
            }
            dict[tempDict, default: []].append(s)

        }
        return Array(dict.values)
    }
}

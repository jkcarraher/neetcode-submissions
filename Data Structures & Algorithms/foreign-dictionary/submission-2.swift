class Solution {
    func foreignDictionary(_ words: [String]) -> String {
        var adj: [Character: [Character]] = [:]
        for word in words {
            for ch in word {
                if adj[ch] == nil {
                    adj[ch] = []
                }
            }
        }


        for i in 0..<(words.count-1) {
            let word1 = Array(words[i])
            let word2 = Array(words[i+1])
            let minLen = min(word1.count, word2.count)
            if word1.count > word2.count && word1[..<minLen] == word2[..<minLen] {
                return ""
            }

            for j in 0..<minLen {
                if word1[j] != word2[j] {
                    adj[word1[j]]!.append(word2[j])
                    break
                }
            }

        }

        var visited: [Character:Bool] = [:] 
        var res: [Character] = []
        
        func dfs(_ c: Character) -> Bool {
            if visited[c] != nil {
                return visited[c]!
            }
            visited[c] = true

            for child in adj[c]! {
                if dfs(child) {
                    return true
                }
            }
            visited[c] = false
            res.append(c)
            return false
        }

        for val in adj {
            if dfs(val.key) {
                return ""
            }
        }
        res.reverse()

        return String(res)

    }
}
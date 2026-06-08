class Solution {
    func foreignDictionary(_ words: [String]) -> String {
        var nodes: [Character: Node] = [:]
        for word in words {
            for ch in word {
                if nodes[ch] == nil {
                    nodes[ch] = Node(ch)
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
                    if nodes[word1[j]] == nil {
                        nodes[word1[j]] = Node(word1[j])
                    }
                    if nodes[word2[j]] == nil {
                        nodes[word2[j]] = Node(word2[j])
                    }

                    nodes[word1[j]]!.children[word2[j]] = nodes[word2[j]]!
                    break
                }
            }

        }

        var visited: [Character:Bool] = [:] 
        var res: [Character] = []
        
        func dfs(_ n: Node) -> Bool {
            if visited[n.val] != nil {
                return visited[n.val]!
            }
            visited[n.val] = true

            for child in n.children {
                if dfs(child.value) {
                    return true
                }
            }
            visited[n.val] = false
            res.append(n.val)
            return false
        }

        for node in nodes {
            if dfs(node.value) {
                return ""
            }
        }
        res.reverse()

        return String(res)

    }
}

class Node { 
    let val: Character
    var children: [Character: Node] = [:]

    init(_ val: Character) {
        self.val = val
    }
}
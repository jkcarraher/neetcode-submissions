class Node {
    var val: Character? = nil
    var idx: Int = -1
    var children: [Character: Node] = [:]

    init(_ val: Character? = nil) {
        self.val = val
    }
}

class Trie {
    var root = Node()

    func addWord(_ word: String, _ wordIdx: Int) {
        var curr = root
        for char in word {
            if curr.children[char] == nil {
                curr.children[char] = Node(char)
            }
            curr = curr.children[char]!
        }
        curr.idx = wordIdx
    }
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let rows = board.count
        let cols = board[0].count

        var retSet = Set<String>()
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)

        // Add all words into the Trie
        let trie = Trie()
        for (i,word) in words.enumerated() {
            trie.addWord(word, i)
        }
        
        func dfs(_ r: Int, _ c: Int, _ curr: Node ) {
            // NOT out of bounds
            guard r >= 0 && c >= 0 && r < rows && c < cols else { return }
            // NOT already been here
            guard !visited[r][c] else { return }
            // IN trie 
            guard let nxt = curr.children[board[r][c]] else { return }

            // Success-- Proceed
            if nxt.idx != -1 {
                retSet.insert(words[nxt.idx])
            }
            visited[r][c] = true
        

            dfs(r+1, c, nxt)
            dfs(r-1, c, nxt)
            dfs(r, c+1, nxt)
            dfs(r, c-1, nxt)

            visited[r][c] = false
        }

        for r in 0..<board.count {
            for c in 0..<board[0].count {
                dfs(r,c, trie.root)
            }
        }

        return Array(retSet)
        
    }
    
}
class WordDictionary {
    var root = Node()

    func addWord(_ word: String) {
        let word = Array(word)
        var curr = root
        var i = 0

        while i < word.count {
            guard let nxt = curr.children[word[i]] else { break }
            if i+1 == word.count { nxt.isEnd = true }

            curr = nxt
            i+=1
        }
        while i < word.count {
            let nxt = Node(word[i])
            if i+1 == word.count { nxt.isEnd = true }
            curr.children[word[i]] = nxt
            
            curr = nxt
            i+=1
        }
    }

    func search(_ word: String) -> Bool {
        let word = Array(word)
        var curr = root
        var i = 0

        return sHelper(word, curr, i)
    }
    func sHelper(_ word: [Character], _ curr: Node, _ i: Int) -> Bool {
        var curr = curr
        var i = i

        while i < word.count {
            if word[i] == "." {
                for child in curr.children.values {
                    if sHelper(word, child, i+1) { return true}
                }
                return false
            } else {
                guard let nxt = curr.children[word[i]] else { return false }

                curr = nxt
                i+=1
            }
        }
        if curr.isEnd {
            return true
        }
        return false
    }
}

class Node {
    var val: Character?
    var isEnd: Bool = false
    var children: [Character:Node] = [:]

    init (_ val: Character? = nil) {
        self.val = val
    }
}
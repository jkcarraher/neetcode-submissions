class PrefixTree {
    let root = Node()

    func insert(_ word: String) {
        var curr = root
        let word = Array(word)
        var i = 0

        while i < word.count {
            guard let nxt = curr.children[word[i]] else {break}
            if i == word.count-1 {
                nxt.isEnd = true
            }
            curr = nxt
            i += 1
        }

        while i < word.count {
            let nxt = Node(word[i])
            if i == word.count-1 {
                nxt.isEnd = true
            }
            curr.children[word[i]] = nxt
            curr = nxt
            i+=1
        }
    }

    func search(_ word: String) -> Bool {
        var curr = root
        let word = Array(word)
        var i = 0

        while i < word.count {
            guard let nxt = curr.children[word[i]] else { return false }
            curr = nxt
            i+=1
        }
        if curr.isEnd {
            return true
        }
        return false
    }

    func startsWith(_ prefix: String) -> Bool {
        var curr = root
        let prefix = Array(prefix)
        var i = 0

        while i < prefix.count {
            guard let nxt = curr.children[prefix[i]] else { return false }
            curr = nxt
            i+=1
        }
        return true
    }
}

class Node {
    var text: Character?
    var isEnd: Bool = false
    var children: [Character:Node] = [:]

    init (_ inText: Character? = nil) {
        self.text = inText
    }
}
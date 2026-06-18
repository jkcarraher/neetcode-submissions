class Node:
    def __init__(self, val):
        self.val: str = val
        self.isWord: bool = False
        self.children: dict[str, Node] = {}

class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        heads: dict[str, Node] = {}
        # Build Trie
        for word in wordDict:
            # Get / Create word head
            if word[0] in heads :
                wCurr = heads[word[0]]
            else:
                wCurr = Node(word[0])
                heads[word[0]] = wCurr
            if len(word) == 1:
                wCurr.isWord = True
            
            for i in range(1, len(word)):
                isEnd = i == len(word)-1
                
                if word[i] in wCurr.children :
                    nxtNode = wCurr.children[word[i]]
                else:
                    nxtNode = Node(word[i])
                    
                if isEnd: nxtNode.isWord = True
                wCurr.children[word[i]] = nxtNode
                wCurr = nxtNode

        # EXPLORE S
        
        # fetch first head
        if s[0] in heads :
            curr = heads[ s[0] ]
        else :
            return False
        
        cache = {}
        def dfs(node: Node, i: int) -> bool:
            if i >= len(s): return node.isWord
            if i in cache: return cache[i]

            c = s[i]
            retBool = False
            if node.isWord and c in heads:
                retBool = retBool or dfs(heads[c], i+1)
            if c in node.children:
                retBool = retBool or dfs(node.children[c], i+1)
            
            cache[i] = retBool
            return retBool
        
        return dfs(curr, 1)
        
    
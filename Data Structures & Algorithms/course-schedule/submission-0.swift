class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var nodes: [Int:Node] = [:]
        

        for preReq in prerequisites {
            let a = preReq[0]
            let b = preReq[1]

            if nodes[b] == nil {
                print("created B")
                nodes[b] = Node(b)
            }
            if nodes[a] == nil {
                print("created A")
                nodes[a] = Node(a)
            }

            let bNode = nodes[b]!
            let aNode = nodes[a]!

            let foundCycle = dfs(aNode, b)
            if foundCycle {
                return false 
            }

            bNode.children[a] = aNode
        }
        return true

        func dfs(_ node: Node,_ val: Int ) -> Bool {
            guard node.val != val else { return true }

            for (_, child) in node.children {
                print("parsed: ", child.val)
                if dfs(child, val) { return true }
            }
            return false
        }

    }
}

class Node {
    let val: Int
    var children: [Int:Node] = [:]

    init(_ val: Int) {
        self.val = val
    }
}

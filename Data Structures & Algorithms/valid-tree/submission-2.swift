class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard edges.count > 0 else { return true }
        var root: Node? = nil
        var nodes: [Int: Node] = [:]

        for edge in edges {
            // Add or create a & b Nodes
            let a = edge[0]
            let b = edge[1]
            if nodes[a] == nil { nodes[a] = Node(a) }
            let aNode = nodes[a]!
            if nodes[b] == nil { nodes[b] = Node(b) }
            let bNode = nodes[b]!

            aNode.neighbors[b] = bNode
            bNode.neighbors[a] = aNode
        }

        var visited: Set<Int> = []
        var cycleDetected = false
        let start = nodes[0]!
        dfs(start, nil)
        print("Visited", visited)
        
        return !cycleDetected && visited.count == n

        func dfs(_ node: Node, _ prev: Node?) {
            if visited.contains(node.val) {
                cycleDetected = true
                print("Cycle Detected")
                return
            }
            visited.insert(node.val)

            for (_, neighbor) in node.neighbors {
                if prev == nil || neighbor.val != prev!.val {
                    dfs(neighbor, node)
                }
            }

            return
        }
    }
}

class Node {
    let val: Int
    var neighbors: [Int:Node] = [:]

    init (_ val: Int ) {
        self.val = val
    }
}

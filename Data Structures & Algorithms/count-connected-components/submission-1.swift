class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var nodes: [Int:Node] = [:]
        
        // Build Graphs
        for edge in edges {
            let a = edge[0]
            let b = edge[1]
            var aNode: Node
            var bNode: Node
            if nodes[a] != nil { aNode = nodes[a]! } else { aNode = Node(a) }
            if nodes[b] != nil { bNode = nodes[b]! } else { bNode = Node(b) }
            nodes[a] = aNode
            nodes[b] = bNode

            aNode.neighbors[b] = bNode
            bNode.neighbors[a] = aNode
        }

        let rem = n-nodes.count

        var graphCount = 0
        while nodes.count > 0 {
            graphCount+=1
            let firstNode = nodes.first!.value
            var visited: Set<Int> = []
            dfs(firstNode, nil, &visited)
            for visit in visited {
                nodes.removeValue(forKey: visit)
            }
        }
        
        return graphCount+rem


        func dfs(_ node: Node, _ prev: Node?, _ visited: inout Set<Int>) {
            if visited.contains(node.val) { return }
            visited.insert(node.val)

            for (_, neighbor) in node.neighbors {
                dfs(neighbor, node, &visited)
            }
        }
    }
}

class Node {
    let val: Int
    var neighbors: [Int: Node] = [:]

    init (_ val: Int) {
        self.val = val
    }
}
/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    var visited: [Int: Node] = [:]

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }

        // If we've already been here, return the node:
        if visited[node.val] != nil {
            return visited[node.val]
        }

        let nodeCopy = Node(node.val)
        visited[node.val] = nodeCopy

        for neighbor in node.neighbors {
            nodeCopy.neighbors.append( cloneGraph(neighbor) )
        }

        return nodeCopy
    }
}

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack: [(TreeNode, Int)] = [(root, 1)]
        var max = 1

        // DFS
        while !stack.isEmpty {
            let curr = stack.popLast()!
            let currNode = curr.0
            let currDepth: Int = curr.1

            if currNode.left == nil && currNode.right == nil {
                // Reached a leaf
                if max < currDepth {
                    max = currDepth
                }
            } else {
                if currNode.left != nil {
                    stack.append( (currNode.left!, (currDepth+1) ) )
                }
                if currNode.right != nil {
                    stack.append( (currNode.right!, (currDepth+1)) )
                }
            }
        }

        return max
    }
}

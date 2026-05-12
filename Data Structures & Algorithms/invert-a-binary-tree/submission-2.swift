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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue: [TreeNode] = [root]
        // Lets Try dfs (O(V))
        while !queue.isEmpty {
            let left = queue.first!.left ?? nil
            let right = queue.first!.right ?? nil
            
            if left != nil {
                queue.append(left!)
            } 
            if right != nil {
                queue.append(right!)
            }
            
            queue.first!.left = right
            queue.first!.right = left
            
            queue.removeFirst()
        }
        return root
    }
}

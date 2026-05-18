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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {return -1}
        var stack: [TreeNode] = []
        var curr: TreeNode? = root
        var k = k

        while curr != nil  || !stack.isEmpty {
            // Get to the smallest
            while let c = curr {
                stack.append(c)
                curr = c.left
            }

            let c = stack.removeLast()
            k-=1

            if k == 0 {
                return c.val
            }

            curr = c.right 
        }
        
        return -1
    }
}

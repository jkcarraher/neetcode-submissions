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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var curr = root

        while let c = curr {
            if p!.val > c.val && q!.val > c.val {
                curr = c.right
            } else if p!.val < c.val && q!.val < c.val {
                curr = c.left
            } else {
                return c
            }
        }
        return nil
    }
}

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        return validate(root, nil, nil)
    }
    func validate(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let r = root else { return true }

        if let min = min, r.val <= min {
            return false
        }

        if let max = max, r.val >= max {
            return false
        }

        return validate( r.left, min, r.val) && validate( r.right, r.val, max)
    }
}

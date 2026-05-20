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
    var maxSum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = helper(root)
        return maxSum
    }

    func helper (_ root:TreeNode?) -> Int {
        guard let root = root else {return 0 }

        let leftSum = max(helper(root.left), 0)
        let rightSum = max(helper(root.right), 0)
        let val = root.val

        maxSum = max(val + leftSum + rightSum, maxSum)

        return root.val + max(leftSum, rightSum)
    }
}

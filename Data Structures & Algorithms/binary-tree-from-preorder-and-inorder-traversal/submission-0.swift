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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else {return nil}

        var inorderDict: [Int:Int] = [:]
        for (i, val) in inorder.enumerated() {
            inorderDict[val] = i
        }

        let root = TreeNode(preorder[0])
        let mid = inorderDict[preorder[0]]!

        root.left = buildTree(Array(preorder[1..<(mid+1)]), Array(inorder[..<mid]) )
        root.right = buildTree(Array(preorder[(mid+1)...]), Array(inorder[(mid+1)...]) )

        return root 
    }
}

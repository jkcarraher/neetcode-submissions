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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let rootP = p, let rootQ = q else { return p == nil && q == nil }

        //BFS O[,,,]I
        var pq: [TreeNode?] = [rootP]
        var qq: [TreeNode?] = [rootQ]

        while !pq.isEmpty || !qq.isEmpty {
            let poppedP = pq.removeFirst()
            let poppedQ = qq.removeFirst()

            if poppedP == nil && poppedQ == nil { continue }
            guard let currP = poppedP, let currQ = poppedQ, currP.val == currQ.val else { return false }

            // P appends
            pq.append(currP.left)
            pq.append(currP.right)

            //Q appends
            qq.append(currQ.left)
            qq.append(currQ.right)
        }
        return true
    }
}

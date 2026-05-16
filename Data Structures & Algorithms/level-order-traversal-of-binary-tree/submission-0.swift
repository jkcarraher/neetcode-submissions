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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else { return [] }
        var retArr: [[Int]] = [[]]
        var queue: [(TreeNode, Int)] = [(r, 0)]

        // bfs traversal - queue
        while !queue.isEmpty {
            let currT = queue.removeFirst()
            let curr = currT.0
            let depth = currT.1
            if retArr.count-1 == depth {
                retArr[depth].append(curr.val)
            } else {
                retArr.append([curr.val])
            }

            if curr.left != nil {
                queue.append((curr.left!, depth+1))
            }
            if curr.right != nil {
                queue.append((curr.right!, depth+1))
            }
        }

        return retArr
    }
}

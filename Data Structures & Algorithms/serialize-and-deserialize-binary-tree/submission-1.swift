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

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }

        let retStr = sHelper(root, "")
        
        return retStr
    }

    func sHelper(_ root: TreeNode?,_ str: String) -> String {
        guard let root = root else { 
            return str + "N" 
        }
        
        let left = sHelper(root.left, str)
        let right = sHelper(root.right, str)

        let retStr = String(root.val) + "," + left + "," + right
        return retStr

    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        
        var tokens = data.split(separator: ",").map { String($0) }

        return dHelper(&tokens)
    }

    func dHelper(_ tokens: inout [String] ) -> TreeNode? {
        let token: String = tokens.removeFirst()

        if token == "N" {
            return nil
        }

        let node = TreeNode(Int(token)!)

        node.left = dHelper(&tokens)
        node.right = dHelper(&tokens)

        return node
    }
}

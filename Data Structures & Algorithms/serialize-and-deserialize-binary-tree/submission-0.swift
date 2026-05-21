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

        print("Encode - ", retStr)
        
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
        var index = 0

        return dHelper(&tokens, &index)
    }

    func dHelper(_ tokens: inout [String], _ index: inout Int) -> TreeNode? {

        let token = tokens[index]
        index += 1

        if token == "N" {
            return nil
        }

        let node = TreeNode(Int(token)!)

        node.left = dHelper(&tokens, &index)
        node.right = dHelper(&tokens, &index)

        return node
    }
}

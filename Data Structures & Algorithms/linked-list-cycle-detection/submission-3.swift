/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var tortise = head
        var hare = head

        while let h = hare, let hn = h.next, let t = tortise {
            tortise = t.next
            hare = hn.next

            if tortise === hare {
                return true
            }
        }
        return false

    }
}

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
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        var curr: ListNode? = head
        var prev: ListNode? = nil

        while curr != nil {
            let next = curr!.next

            curr!.next = prev

            prev = curr
            curr = next
        }
        return prev

    }
}

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
    func reverseLL(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode? = nil
        while let c = curr {
            let next = c.next
            c.next = prev
            prev = c
            curr = next
        }
        return prev
    }

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // Step 1 - Reverse LL
        let revHead = reverseLL(head)

        // Step 2 - Remove from Index
        let dummyHead = ListNode(-1)
        dummyHead.next = revHead
        var curr = revHead
        var prev = dummyHead

        for _ in 0..<(n-1) {
            guard let c = curr else { break }

            prev = c
            curr = c.next
        }

        if let c = curr, let cn = c.next {
            prev.next = cn
        } else {
            prev.next = nil
        }

        // Step 3 - Reverse back
        return reverseLL(dummyHead.next)
    }
}

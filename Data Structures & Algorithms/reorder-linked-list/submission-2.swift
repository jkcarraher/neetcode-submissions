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

    func reorderList(_ head: ListNode?) {
        var tortoise = head
        var hare = head

        while let h = hare, let hn = h.next, let hnn = hn.next {
            hare = hnn
            tortoise = tortoise?.next
        }

        var second = reverseLL(tortoise?.next)
        tortoise?.next = nil
        var first = head
        while let f = first, let s = second {
            let fNxt = f.next
            let sNxt = s.next
            
            f.next = s
            s.next = fNxt

            first = fNxt
            second = sNxt
        }
    }
}

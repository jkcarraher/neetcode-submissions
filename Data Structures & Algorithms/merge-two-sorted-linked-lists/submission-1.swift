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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummyHead = ListNode(-1)
        var curr = dummyHead

        var list1 = list1
        var list2 = list2

        while let l1 = list1, let l2 = list2 {
            if l1.val < l2.val {
                curr.next = l1
                list1 = l1.next
                curr = l1
            } else {
                curr.next = l2
                list2 = l2.next
                curr = l2
            }
        }

        if let l1 = list1 {
            curr.next = l1
        } else if let l2 = list2 {
            curr.next = l2
        }

        return dummyHead.next
    }
}

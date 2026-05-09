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
    func merge2Lists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(-1)
        var curr = dummyHead

        var list1 = list1
        var list2 = list2

        while let l1 = list1, let l2 = list2 {

            if l1.val < l2.val {
                curr.next = l1
                list1 = l1.next
            } else {
                curr.next = l2
                list2 = l2.next
            }
            curr = curr.next!
        }

        if let l1 = list1 {
            curr.next = l1
        } else if let l2 = list2 {
            curr.next = l2
        }        

        return dummyHead.next
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count < 1 {
            return nil
        }

        var retLists = lists

        while retLists.count > 1 {
            var mergedLists: [ListNode?] = []
            
            for i in stride(from: 0, to: retLists.count, by: 2){
                let l1 = retLists[i]
                let l2 = (i+1 < retLists.count) ? retLists[i+1] : nil
                mergedLists.append(merge2Lists(l1, l2))
            }
            retLists = mergedLists
        }

        return retLists[0]
    }
}

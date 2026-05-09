# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def merge2Lists(self, h1: Optional[ListNode], h2: Optional[ListNode]) -> Optional[ListNode]:
        dummyHead = ListNode()
        curr = dummyHead

        while h1 and h2:
            if h1.val < h2.val:
                curr.next = h1
                h1 = h1.next
            else:
                curr.next = h2
                h2 = h2.next
            curr = curr.next

        if h1:
            curr.next = h1
        elif h2:
            curr.next = h2
        
        return dummyHead.next

    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        if lists:
            curr = lists[0]
        else:
            curr = None

        for i in range(1, len(lists)):
            curr = self.merge2Lists(curr, lists[i])
        
        return curr

        
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def reverseLL(self, head: Optional[ListNode]) -> Optional(ListNode):
        curr = head
        prev = None
        while curr:
            next = curr.next
            curr.next = prev
            prev = curr
            curr = next
        return prev

    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        revH = self.reverseLL(head)

        dummyHead = ListNode()
        dummyHead.next = revH

        curr = revH
        prev = dummyHead
        i = 0

        for i in range(n-1):
            prev = curr
            curr = curr.next
        
        prev.next = curr.next


            
        return self.reverseLL(dummyHead.next)
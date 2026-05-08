# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    # Gives us the new head
    def reverseLL(self, head: Optional[ListNode]) -> Optional[ListNode]:

        curr = head
        prev = None

        while curr:
            next = curr.next

            curr.next = prev
            
            prev = curr
            curr = next

        return prev
        

    def reorderList(self, head: Optional[ListNode]) -> None:
        hare = head
        tortoise = head
        # Jump the hare to the end
        while hare and hare.next and hare.next.next:
            tortoise = tortoise.next
            hare = hare.next.next
        
        sec = tortoise.next
        tortoise.next = None
        secRev = self.reverseLL(sec)
        newTail = head

        while newTail and secRev:
            next = newTail.next
            secNxt = secRev.next

            newTail.next = secRev
            secRev.next = next

            newTail = next
            secRev = secNxt

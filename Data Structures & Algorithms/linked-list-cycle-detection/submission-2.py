# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        tortise = head
        hare = head
        isFirst = True
 
        while tortise and hare:
            if (not isFirst) and (tortise == hare) :
                return True
            
            tortise = tortise.next
            hare = hare.next
            if hare:
                hare = hare.next
            isFirst = False
        
        return False
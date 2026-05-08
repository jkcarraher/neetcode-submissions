# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # edge case empty list
        if not head:
            return head

        currNode = head
        prevNode = None
        # O(n) - build stack of LinkedList
        while currNode.next :
            nextNode = currNode.next

            currNode.next = prevNode
            prevNode = currNode
            
            # Move on
            currNode = nextNode
        
        currNode.next = prevNode




        return currNode

        


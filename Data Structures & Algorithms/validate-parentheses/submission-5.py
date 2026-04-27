class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        for c in s:
            match c:
                case '(':
                    stack.append(c)
                case '{':
                    stack.append(c)
                case '[':
                    stack.append(c)
                case ')':
                    if len(stack) == 0 or not stack.pop() == '(':
                        return False
                case '}':
                    if len(stack) == 0 or not stack.pop() == '{':
                        return False
                case ']':
                    if len(stack) == 0 or not stack.pop() == '[':
                        return False
        return len(stack) == 0
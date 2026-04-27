class Solution:
    def isNum(self, inNum) -> bool:
        try:
            int(inNum)
            return True
        except ValueError:
            return False

    def evalRPN(self, tokens: List[str]) -> int:
        operands = []

        for c in tokens:
            if self.isNum(c):
                print("appended", c)
                operands.append(int(c))
            elif c == "+":
                res = int(operands.pop() + operands.pop())
                print("res", res, "+")
                operands.append(res)
            elif c == "-":
                b, a = operands.pop(), operands.pop()
                res = int(a - b)
                print("res", res, "-")
                operands.append(res)
            elif c == "*":
                res = int(operands.pop() * operands.pop())
                print("res", res, "*")
                operands.append(res)
            elif c == "/":
                b, a = operands.pop(), operands.pop()
                res = int(a / b)
                print("res", res, "/")
                operands.append(res)
        
        return operands[0]

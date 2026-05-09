class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [String] = []

        for c in s {
            switch c {
            case "(":
                stack.append("(")
            case "[":
                stack.append("[")
            case "{":
                stack.append("{")
            case ")":
                if stack.popLast() != "(" {
                    return false
                }
            case "]":
                if stack.popLast() != "[" {
                    return false
                }
            case "}":
                if stack.popLast() != "{" {
                    return false
                }
            default:
                return false
            }
        }
        return stack.count == 0
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []

        for c in s {
            switch c {
            case "{", "[", "(":
                stack.append(c)
            case "]":
                if stack.isEmpty || stack.popLast() != "[" {
                    return false
                }
            case ")":
                if stack.isEmpty || stack.popLast() != "(" {
                    return false
                }
            case "}":
                if stack.isEmpty || stack.popLast() != "{" {
                    return false
                }
            default:
                return false
            }
            
        }

        return stack.isEmpty
    }
}

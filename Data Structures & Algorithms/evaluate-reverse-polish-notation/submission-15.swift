class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for t in tokens {
            if let num = Int(t) {
                stack.append(num)
            } else {
                let b = stack.removeLast()
                let a = stack.removeLast()

                if t == "+" {
                    stack.append(a+b)
                } else if t == "-" {
                    stack.append(a-b)
                } else if t == "*" {
                    stack.append(a*b)
                } else if t == "/" {
                    stack.append(a/b)
                }
            }
        }
        return stack.removeLast()
    }
}

class Solution {
    /**
     * @param {string[]} tokens
     * @return {number}
     */
    evalRPN(tokens) {
        let stack = [];

        for (const t of tokens) {
            if (!isNaN(t)) {         // or Number.isInteger(Number(t))
                stack.push(Number(t));
            } else {
                let b = stack.pop();
                let a = stack.pop();

                if (t == "+") {
                    stack.push(a+b);
                } else if (t == "-") {
                    stack.push(a-b);
                } else if (t == "*") {
                    stack.push(a*b);
                } else if (t == "/") {
                    stack.push(Math.trunc(a/b));
                }
            }
        }

        return stack.pop();
    }
}

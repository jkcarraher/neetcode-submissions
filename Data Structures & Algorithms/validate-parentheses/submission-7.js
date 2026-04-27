class Solution {
    /**
     * @param {string} s
     * @return {boolean}
     */
    isValid(s) {
        let stack = []
        for (const c of s) {
            console.log(c, stack);

            switch (c) {
                case '{':
                case '[':
                case '(':
                    stack.push(c);
                    break;
                case '}':
                    if (stack.length === 0 || stack.pop() !== '{') {
                        return false;
                    }
                    break;
                case ']':
                    if (stack.length === 0 || stack.pop() !== '[') {
                        return false;
                    }
                    break;
                case ')':
                    if (stack.length === 0 || stack.pop() !== '(') {
                        return false;
                    }
                    break
            }
        }
        return stack.length == 0
    }
}

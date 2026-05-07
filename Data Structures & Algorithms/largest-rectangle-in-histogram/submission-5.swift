class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [(Int, Int)] = []
        var maxArea = -1

        // O(n)
        for (i, val) in heights.enumerated() {
            var lastPoppedI = -1
            
            while !stack.isEmpty && stack.last!.1 > val {
                let popped = stack.popLast()!
                lastPoppedI = popped.0
                let area = (i - popped.0) * popped.1

                if area > maxArea {
                    maxArea = area
                }
            }

            if lastPoppedI == -1 {
                stack.append((i, val))
            } else {
                stack.append((lastPoppedI, val))
            }
        }

        // O(n)
        print(stack)
        while !stack.isEmpty {
            let popped = stack.popLast()!
            let area = (heights.count - popped.0) * popped.1
            print(area)

            if area > maxArea {
                maxArea = area
            }
        }

        return maxArea
    }
}

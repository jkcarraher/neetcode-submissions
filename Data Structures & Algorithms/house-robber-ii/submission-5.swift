class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count != 1 else { return nums[0] }
        func robArr(_ arr: [Int]) -> Int {
            var visited: [Int:Int] = [:]
            func dfs(_ i: Int) -> Int {
                guard i < arr.count else { return 0 }
                if visited[i] != nil {
                    return visited[i]!
                }
                let skip = dfs(i+1)
                let steal = arr[i]+dfs(i+2)

                visited[i] = max(skip, steal)
                return visited[i]!
            }
            return dfs(0)
        }
        return max(
            robArr(Array( nums.dropFirst() )),
            robArr(Array( nums.dropLast() ))
            )
    }
}

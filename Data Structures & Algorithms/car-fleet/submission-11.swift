class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let sortedCars: [(Int, Int)] = zip(position, speed).sorted {$0.0 > $1.0}
        var stack: [Double] = []
        for (p, s) in sortedCars {
            let eta = Double(target - p) / Double(s)
            stack.append(eta)
            if (stack.count >= 2 && stack[stack.count-1]<=stack[stack.count-2]){
                stack.removeLast()
            }
        }
        return stack.count
    }
}

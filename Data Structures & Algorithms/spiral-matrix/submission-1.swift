class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var retArr: [Int] = []
        var l = 0, r = matrix[0].count
        var t = 0, b = matrix.count

        while l < r && t < b {
            for i in l..<r {
                retArr.append(matrix[t][i])
            }
            t+=1
            for i in t..<b {
                retArr.append(matrix[i][r-1])
            }
            r-=1

            if l==r || t==b {
                break
            }

            for i in stride(from: r-1, to: l-1, by: -1) {
                retArr.append(matrix[b-1][i])
            }
            b-=1

            for i in stride(from: b-1, to: t-1, by: -1) {
                retArr.append(matrix[i][l])
            }
            l+=1
        }

        return retArr
    }
}

class Solution:
    def reverseBits(self, n: int) -> int:
        ret = 0
        for i in range(32):
            currBit = (n >> i) & 1
            ret += (currBit << (31 - i))
        return ret
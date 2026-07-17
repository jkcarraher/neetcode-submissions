class Solution:
    def getSum(self, a: int, b: int) -> int:
        MASK = 0xffffffff
        a &= MASK
        b &= MASK

        carry = 0
        rsum = 0

        for i in range(32):
            bitA = (a >> i) & 1
            bitB = (b >> i) & 1

            total = bitA + bitB + carry

            if total & 1:
                rsum += (1 << i)

            carry = total >> 1

        if rsum & (1 << 31):
            rsum -= 1 << 32

        return rsum

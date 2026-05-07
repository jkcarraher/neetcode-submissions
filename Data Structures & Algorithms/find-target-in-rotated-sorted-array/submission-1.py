class Solution:
    def search(self, nums: List[int], target: int) -> int:
        l, r = 0, len(nums)-1

        while l <= r:
            m = (l+r) // 2
            print(m)
            if nums[m] == target:
                return m

            if nums[l] <= nums[m]:
                # M on Left Side
                if nums[l] <= target < nums[m]:
                    r = m-1
                else:
                    l = m+1
            else:
                # M on Right Side
                if nums[m] < target <= nums[r]:
                    l = m+1
                else:
                    r = m-1

        return -1
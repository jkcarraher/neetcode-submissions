class Solution:

    def threeSum(self, nums: List[int]) -> List[List[int]]:
        # O( nlog(n) )
        nums.sort()

        retList = []

        for i, val1 in enumerate(nums):
            if i > 0 and val1 == nums[i-1]:
                continue
            
            j, k = i+1, len(nums)-1
            while j < k:
                sum = val1 + nums[j] + nums[k]
                if sum > 0:
                    k-=1
                elif sum < 0:
                    j+=1
                else:
                    retList.append([val1, nums[j], nums[k]])
                    j += 1
                    while nums[j] == nums[j-1] and j < k:
                        j += 1


        
        return retList

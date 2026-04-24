class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:

        for i, val in enumerate(numbers):
            for j, val2 in enumerate(numbers):
                sum = numbers[i] + numbers[j]
                if sum == target:
                    return [i+1, j+1]

        return [0, 0]
        
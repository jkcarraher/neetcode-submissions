class Solution:
    def carFleet(self, target: int, position: List[int], speed: List[int]) -> int:
        # (position, speed) 
        # Reversed b/c we want to start with ones closest to target
        sortedCars = sorted(zip(position, speed), reverse=True)
        stack = []

        for p, s in sortedCars:
            eta = (target-p)/s
            stack.append(eta)
            if len(stack)>=2 and stack[-1] <= stack[-2]:
                # Gonna end up joining the fleet at the end of the stack
                stack.pop()


        return len(stack)


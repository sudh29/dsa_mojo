# Minimum Swaps for Bracket Balancing
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def minimum_number_of_swaps(self, s: String) -> Int:
        var open_count = 0
        var close_count = 0
        var ub = 0
        var swaps = 0
        var bytes = s.as_bytes()

        for i in range(s.byte_length()):
            if bytes[i] == 91: # '['
                open_count += 1
                if ub > 0:
                    swaps += ub
                    ub -= 1
            else:
                close_count += 1
                ub = close_count - open_count

        return swaps

def main():
    var sol = Solution()
    var s1 = String("[]][][")
    var s2 = String("[[][]]")
    var s3 = String("]]][[[")

    print("String:", s1, "-> Swaps needed:", sol.minimum_number_of_swaps(s1))
    print("String:", s2, "-> Swaps needed:", sol.minimum_number_of_swaps(s2))
    print("String:", s3, "-> Swaps needed:", sol.minimum_number_of_swaps(s3))

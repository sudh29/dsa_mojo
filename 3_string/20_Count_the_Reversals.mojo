# Count the Reversals to make brackets balanced
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def count_rev(self, s: String) -> Int:
        var n = s.byte_length()
        if n % 2 != 0:
            return -1

        var unbalanced_open = 0
        var unbalanced_close = 0
        var bytes = s.as_bytes()

        for i in range(n):
            if bytes[i] == 123: # '{'
                unbalanced_open += 1
            else:
                if unbalanced_open > 0:
                    unbalanced_open -= 1
                else:
                    unbalanced_close += 1

        var reversals = (unbalanced_open + 1) // 2 + (unbalanced_close + 1) // 2
        return reversals

def main():
    var sol = Solution()
    var s1 = String("}{{}}{{{")
    var s2 = String("{{}{{{}{{}}{{")
    var s3 = String("{{{{")
    var s4 = String("{{{{}}")

    print("String:", s1, "-> Reversals needed:", sol.count_rev(s1))
    print("String:", s2, "-> Reversals needed:", sol.count_rev(s2))
    print("String:", s3, "-> Reversals needed:", sol.count_rev(s3))
    print("String:", s4, "-> Reversals needed:", sol.count_rev(s4))

# Recursively print all sentences formed from a list of word lists (Cartesian product)
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def form_sentences(self, word_lists: List[List[String]]) -> List[String]:
        var results = List[String]()
        results.append("")

        for i in range(len(word_lists)):
            var new_results = List[String]()

            for r in range(len(results)):
                var prefix = results[r]
                for w in range(len(word_lists[i])):
                    var word = word_lists[i][w]
                    if prefix.byte_length() == 0:
                        new_results.append(word)
                    else:
                        new_results.append(prefix + " " + word)

            results = new_results^

        return results^

def main():
    var sol = Solution()

    var word_lists = List[List[String]]()

    var l1 = List[String]()
    l1.append("you"); l1.append("we")
    word_lists.append(l1^)

    var l2 = List[String]()
    l2.append("have"); l2.append("are")
    word_lists.append(l2^)

    var l3 = List[String]()
    l3.append("sleep"); l3.append("eat")
    word_lists.append(l3^)

    var sentences = sol.form_sentences(word_lists)
    print("Generated Sentences:")
    for idx in range(len(sentences)):
        print(idx + 1, ":", sentences[idx])

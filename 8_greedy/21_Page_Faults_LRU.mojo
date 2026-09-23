# Page Faults in LRU Cache
# Reference: https://mojolang.org/docs/manual/get-started/

def page_faults(n: Int, c: Int, pages: List[Int]) -> Int:
    var memory = List[Int]()
    var faults = 0

    for i in range(n):
        var page = pages[i]
        var found_idx = -1
        for j in range(len(memory)):
            if memory[j] == page:
                found_idx = j
                break

        if found_idx == -1:
            faults += 1
            if len(memory) == c:
                # Evict least recently used (first element)
                _ = memory.pop(0)
            memory.append(page)
        else:
            # Move accessed page to end (most recently used)
            _ = memory.pop(found_idx)
            memory.append(page)

    return faults

def main():
    var pages = List[Int]()
    pages.append(5)
    pages.append(0)
    pages.append(1)
    pages.append(3)
    pages.append(2)
    pages.append(4)
    pages.append(1)
    pages.append(0)
    pages.append(5)

    var c = 4
    var faults = page_faults(len(pages), c, pages)
    print("Page faults with LRU capacity", c, ":", faults)

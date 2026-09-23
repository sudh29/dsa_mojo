# Find Maximum Meetings in One Room
# Reference: https://mojolang.org/docs/manual/get-started/

struct Meeting(ImplicitlyCopyable, Movable):
    var id: Int
    var start: Int
    var end: Int

    def __init__(out self, id: Int, start: Int, end: Int):
        self.id = id
        self.start = start
        self.end = end

    def __init__(out self, *, copy: Meeting):
        self.id = copy.id
        self.start = copy.start
        self.end = copy.end

def max_meetings(start: List[Int], end: List[Int]) -> List[Int]:
    var n = len(start)
    var meetings = List[Meeting]()
    for i in range(n):
        meetings.append(Meeting(i + 1, start[i], end[i]))

    # Sort meetings ascending by end time
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if meetings[j].end < meetings[min_idx].end:
                min_idx = j
        if min_idx != i:
            var tmp = meetings[i]
            meetings[i] = meetings[min_idx]
            meetings[min_idx] = tmp

    var selected = List[Int]()
    if n > 0:
        selected.append(meetings[0].id)
        var last_end = meetings[0].end

        for i in range(1, n):
            if meetings[i].start > last_end:
                selected.append(meetings[i].id)
                last_end = meetings[i].end

    return selected^

def main():
    var start = List[Int]()
    start.append(1)
    start.append(3)
    start.append(0)
    start.append(5)
    start.append(8)
    start.append(5)

    var end = List[Int]()
    end.append(2)
    end.append(4)
    end.append(6)
    end.append(7)
    end.append(9)
    end.append(9)

    var res = max_meetings(start, end)
    print("Maximum meetings scheduled:", len(res), "Meeting IDs:", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")

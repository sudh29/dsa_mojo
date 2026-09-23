# Activity Selection Problem
# Reference: https://mojolang.org/docs/manual/get-started/

struct Activity(ImplicitlyCopyable, Movable):
    var start: Int
    var end: Int

    def __init__(out self, start: Int, end: Int):
        self.start = start
        self.end = end

    def __init__(out self, *, copy: Activity):
        self.start = copy.start
        self.end = copy.end

def max_activities(start: List[Int], end: List[Int]) -> Int:
    var n = len(start)
    if n == 0:
        return 0

    var activities = List[Activity]()
    for i in range(n):
        activities.append(Activity(start[i], end[i]))

    # Sort by end time
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if activities[j].end < activities[min_idx].end:
                min_idx = j
        if min_idx != i:
            var tmp = activities[i]
            activities[i] = activities[min_idx]
            activities[min_idx] = tmp

    var count = 1
    var last_end = activities[0].end

    for i in range(1, n):
        if activities[i].start > last_end:
            count += 1
            last_end = activities[i].end

    return count

def main():
    var start = List[Int]()
    start.append(1)
    start.append(3)
    start.append(2)
    start.append(5)

    var end = List[Int]()
    end.append(2)
    end.append(4)
    end.append(3)
    end.append(6)

    var count = max_activities(start, end)
    print("Maximum activities that can be performed:", count)

# Given n Appointments, Find Conflicting Appointments
# Reference: https://mojolang.org/docs/manual/get-started/

struct Interval(ImplicitlyCopyable, Movable):
    var start: Int
    var end: Int

    def __init__(out self, start: Int, end: Int):
        self.start = start
        self.end = end

    def __init__(out self, *, copy: Interval):
        self.start = copy.start
        self.end = copy.end

struct Conflict(ImplicitlyCopyable, Movable):
    var i_start: Int
    var i_end: Int
    var j_start: Int
    var j_end: Int

    def __init__(out self, i_s: Int, i_e: Int, j_s: Int, j_e: Int):
        self.i_start = i_s
        self.i_end = i_e
        self.j_start = j_s
        self.j_end = j_e

    def __init__(out self, *, copy: Conflict):
        self.i_start = copy.i_start
        self.i_end = copy.i_end
        self.j_start = copy.j_start
        self.j_end = copy.j_end

def find_conflicting_appointments(mut appointments: List[Interval]) -> List[Conflict]:
    var n = len(appointments)
    # Sort by start time
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if appointments[j].start < appointments[min_idx].start:
                min_idx = j
        if min_idx != i:
            var tmp = appointments[i]
            appointments[i] = appointments[min_idx]
            appointments[min_idx] = tmp

    var conflicts = List[Conflict]()
    for i in range(n - 1):
        for j in range(i + 1, n):
            if appointments[i].end > appointments[j].start:
                conflicts.append(
                    Conflict(
                        appointments[i].start,
                        appointments[i].end,
                        appointments[j].start,
                        appointments[j].end
                    )
                )

    return conflicts^

def main():
    var appts = List[Interval]()
    appts.append(Interval(1, 5))
    appts.append(Interval(3, 7))
    appts.append(Interval(2, 6))
    appts.append(Interval(8, 10))
    appts.append(Interval(5, 8))

    var conflicts = find_conflicting_appointments(appts)
    print("Number of conflicts found:", len(conflicts))
    for i in range(len(conflicts)):
        var c = conflicts[i]
        print("Conflict:", c.i_start, "-", c.i_end, "and", c.j_start, "-", c.j_end)

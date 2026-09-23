# Maximum Trains for which Stoppage can be Provided
# Reference: https://mojolang.org/docs/manual/get-started/

struct Train(ImplicitlyCopyable, Movable):
    var arr: Int
    var dep: Int
    var platform: Int

    def __init__(out self, arr: Int, dep: Int, platform: Int):
        self.arr = arr
        self.dep = dep
        self.platform = platform

    def __init__(out self, *, copy: Train):
        self.arr = copy.arr
        self.dep = copy.dep
        self.platform = copy.platform

def max_stop(n: Int, m: Int, mut trains: List[Train]) -> Int:
    # Sort trains by departure time
    for i in range(m):
        var min_idx = i
        for j in range(i + 1, m):
            if trains[j].dep < trains[min_idx].dep:
                min_idx = j
        if min_idx != i:
            var tmp = trains[i]
            trains[i] = trains[min_idx]
            trains[min_idx] = tmp

    # Last departure time on each platform (-1 initially)
    var platform_last_dep = List[Int]()
    for _ in range(n + 1):
        platform_last_dep.append(-1)

    var count = 0
    for i in range(m):
        var plat = trains[i].platform
        if platform_last_dep[plat] == -1 or trains[i].arr >= platform_last_dep[plat]:
            platform_last_dep[plat] = trains[i].dep
            count += 1

    return count

def main():
    var trains = List[Train]()
    # trains: arr, dep, platform
    trains.append(Train(1000, 1030, 1))
    trains.append(Train(1010, 1020, 1))
    trains.append(Train(1025, 1040, 1))
    trains.append(Train(1000, 1020, 2))
    trains.append(Train(1030, 1045, 2))

    var max_trains = max_stop(2, len(trains), trains)
    print("Maximum trains stopped:", max_trains)

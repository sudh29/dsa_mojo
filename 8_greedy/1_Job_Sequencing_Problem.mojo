# Job Sequencing Problem
# Reference: https://mojolang.org/docs/manual/get-started/

struct Job(ImplicitlyCopyable, Movable):
    var id: Int
    var deadline: Int
    var profit: Int

    def __init__(out self, id: Int, deadline: Int, profit: Int):
        self.id = id
        self.deadline = deadline
        self.profit = profit

    def __init__(out self, *, copy: Job):
        self.id = copy.id
        self.deadline = copy.deadline
        self.profit = copy.profit

struct JobResult:
    var count: Int
    var total_profit: Int

    def __init__(out self, count: Int, total_profit: Int):
        self.count = count
        self.total_profit = total_profit

def job_scheduling(mut jobs: List[Job]) -> JobResult:
    var n = len(jobs)
    if n == 0:
        return JobResult(0, 0)

    # Sort jobs descending by profit
    for i in range(n):
        var max_idx = i
        for j in range(i + 1, n):
            if jobs[j].profit > jobs[max_idx].profit:
                max_idx = j
        if max_idx != i:
            var tmp = jobs[i]
            jobs[i] = jobs[max_idx]
            jobs[max_idx] = tmp

    # Find maximum deadline
    var max_deadline = 0
    for i in range(n):
        if jobs[i].deadline > max_deadline:
            max_deadline = jobs[i].deadline

    # Slots array: -1 means slot is empty
    var slots = List[Int]()
    for _ in range(max_deadline + 1):
        slots.append(-1)

    var job_count = 0
    var total_profit = 0

    for i in range(n):
        var d = jobs[i].deadline
        # Find latest available slot from d down to 1
        for s in range(d, 0, -1):
            if slots[s] == -1:
                slots[s] = jobs[i].id
                job_count += 1
                total_profit += jobs[i].profit
                break

    return JobResult(job_count, total_profit)

def main():
    var jobs = List[Job]()
    jobs.append(Job(1, 4, 20))
    jobs.append(Job(2, 1, 10))
    jobs.append(Job(3, 1, 40))
    jobs.append(Job(4, 1, 30))

    var res = job_scheduling(jobs)
    print("Jobs scheduled:", res.count, ", Total Profit:", res.total_profit)

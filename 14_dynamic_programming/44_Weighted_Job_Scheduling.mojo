# Job Sequencing with Deadlines (Weighted Job Scheduling)

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

def sort_jobs_by_profit_desc(mut jobs: List[Job]):
    for i in range(len(jobs)):
        for j in range(i + 1, len(jobs)):
            if jobs[j].profit > jobs[i].profit:
                var temp = jobs[i]
                jobs[i] = jobs[j]
                jobs[j] = temp

def job_scheduling(mut jobs: List[Job], n: Int) -> List[Int]:
    if n == 0:
        var res = List[Int]()
        res.append(0)
        res.append(0)
        return res^
        
    sort_jobs_by_profit_desc(jobs)
    var max_deadline = 0
    for i in range(n):
        if jobs[i].deadline > max_deadline:
            max_deadline = jobs[i].deadline
            
    var slot = List[Int]()
    for _ in range(max_deadline + 1):
        slot.append(-1)
        
    var num_jobs = 0
    var max_profit = 0
    
    for i in range(n):
        var d = jobs[i].deadline
        var limit = max_deadline if max_deadline < d else d
        var j = limit
        while j > 0:
            if slot[j] == -1:
                slot[j] = jobs[i].id
                num_jobs += 1
                max_profit += jobs[i].profit
                break
            j -= 1
            
    var result = List[Int]()
    result.append(num_jobs)
    result.append(max_profit)
    return result^

def main():
    var jobs = List[Job]()
    jobs.append(Job(1, 4, 20))
    jobs.append(Job(2, 1, 10))
    jobs.append(Job(3, 1, 40))
    jobs.append(Job(4, 1, 30))
    var res = job_scheduling(jobs, len(jobs))
    print("Jobs done:", res[0], "Max profit:", res[1])

# Concurrent Task and Worker Processing Simulation

struct Task(ImplicitlyCopyable, Movable):
    var id: Int
    var payload: String

    def __init__(out self, id: Int, payload: String):
        self.id = id
        self.payload = payload

    def __init__(out self, *, copy: Task):
        self.id = copy.id
        self.payload = copy.payload

struct TaskResult(ImplicitlyCopyable, Movable):
    var task_id: Int
    var processed_length: Int

    def __init__(out self, task_id: Int, processed_length: Int):
        self.task_id = task_id
        self.processed_length = processed_length

    def __init__(out self, *, copy: TaskResult):
        self.task_id = copy.task_id
        self.processed_length = copy.processed_length

def process_task(task: Task) -> TaskResult:
    var length = task.payload.byte_length()
    return TaskResult(task.id, length)

def main():
    var tasks = List[Task]()
    tasks.append(Task(1, "https://450dsa.com/backtracking"))
    tasks.append(Task(2, "https://www.google.com/"))
    tasks.append(Task(3, "https://mojolang.org/docs/manual/"))

    var results = List[TaskResult]()
    for i in range(len(tasks)):
        results.append(process_task(tasks[i]))

    print("Processed", len(results), "tasks:")
    for i in range(len(results)):
        print("Task ID:", results[i].task_id, "Payload bytes:", results[i].processed_length)

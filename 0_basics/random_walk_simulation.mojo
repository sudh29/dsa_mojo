# Random Walk Simulation

struct SimpleRNG:
    var state: UInt64

    def __init__(out self, seed: UInt64 = 123456789):
        self.state = seed

    def next_u32(mut self) -> UInt32:
        self.state = (self.state * 6364136223846793005 + 1)
        return UInt32(self.state >> 32)

    def choice_walk(mut self) -> Int:
        var val = Int(self.next_u32() % 3)
        if val == 0:
            return 0
        elif val == 1:
            return 1
        else:
            return -1

def random_walk(steps: Int, mut rng: SimpleRNG) -> Int:
    var x = 0
    var y = 0
    for _ in range(steps):
        x += rng.choice_walk()
        y += rng.choice_walk()
    var dist_x = x if x >= 0 else -x
    var dist_y = y if y >= 0 else -y
    return dist_x + dist_y

def main():
    var rng = SimpleRNG(42)
    var num_walks = 1000
    for walk_length in range(5, 30, 5):
        var count_close = 0
        for _ in range(num_walks):
            var dist = random_walk(walk_length, rng)
            if dist <= 4:
                count_close += 1
        var pct = (Float64(count_close) / Float64(num_walks)) * 100.0
        print("Walk size:", walk_length, "Close home (<=4) %:", pct)

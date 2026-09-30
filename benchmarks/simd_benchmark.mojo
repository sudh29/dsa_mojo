# Performance Benchmark: Scalar vs. Native SIMD Hardware Acceleration in Mojo 1.1

from std.time import perf_counter_ns
from dsa import simd_dot_product_f32, simd_sum_i32

def scalar_dot_product(a: List[Float32], b: List[Float32]) -> Float32:
    var total: Float32 = 0.0
    for i in range(len(a)):
        total += a[i] * b[i]
    return total

def scalar_sum(a: List[Int]) -> Int:
    var total = 0
    for i in range(len(a)):
        total += a[i]
    return total

def main():
    var n = 200000
    print("Preparing", n, "elements for performance benchmark...")

    var a = List[Float32]()
    var b = List[Float32]()
    var nums = List[Int]()
    for _ in range(n):
        a.append(1.5)
        b.append(2.0)
        nums.append(3)

    # Benchmark Dot Product
    var t0 = perf_counter_ns()
    var scalar_res = scalar_dot_product(a, b)
    var t_scalar_dot = Float64(perf_counter_ns() - t0) / 1000000.0 # ms

    var t1 = perf_counter_ns()
    var simd_res = simd_dot_product_f32(a, b)
    var t_simd_dot = Float64(perf_counter_ns() - t1) / 1000000.0 # ms

    print("\n--- Dot Product Benchmark (", n, "elements) ---")
    print("  Scalar Loop Time :", t_scalar_dot, "ms | Result:", scalar_res)
    print("  SIMD Vector Time :", t_simd_dot, "ms | Result:", simd_res)
    if t_simd_dot > 0.0:
        print("  SIMD Speedup     :", t_scalar_dot / t_simd_dot, "x")

    # Benchmark Sum
    var t2 = perf_counter_ns()
    var s_sum = scalar_sum(nums)
    var t_scalar_sum = Float64(perf_counter_ns() - t2) / 1000000.0 # ms

    var t3 = perf_counter_ns()
    var v_sum = simd_sum_i32(nums)
    var t_simd_sum = Float64(perf_counter_ns() - t3) / 1000000.0 # ms

    print("\n--- Array Sum Benchmark (", n, "elements) ---")
    print("  Scalar Loop Time :", t_scalar_sum, "ms | Result:", s_sum)
    print("  SIMD Vector Time :", t_simd_sum, "ms | Result:", v_sum)
    if t_simd_sum > 0.0:
        print("  SIMD Speedup     :", t_scalar_sum / t_simd_sum, "x")

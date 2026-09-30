# Hardware-Accelerated Algorithms using Mojo Native SIMD Vectorization
# Exploits CPU SIMD vector lanes (4 / 8 wide) for maximum throughput.

def simd_dot_product_f32(a: List[Float32], b: List[Float32]) -> Float32:
    var n = len(a)
    var total: Float32 = 0.0
    var i = 0
    while i + 4 <= n:
        var va = SIMD[DType.float32, 4](a[i], a[i+1], a[i+2], a[i+3])
        var vb = SIMD[DType.float32, 4](b[i], b[i+1], b[i+2], b[i+3])
        total += (va * vb).reduce_add()
        i += 4
    while i < n:
        total += a[i] * b[i]
        i += 1
    return total

def simd_vector_add_f32(a: List[Float32], b: List[Float32]) -> List[Float32]:
    var n = len(a)
    var res = List[Float32]()
    var i = 0
    while i + 4 <= n:
        var va = SIMD[DType.float32, 4](a[i], a[i+1], a[i+2], a[i+3])
        var vb = SIMD[DType.float32, 4](b[i], b[i+1], b[i+2], b[i+3])
        var vc = va + vb
        res.append(vc[0])
        res.append(vc[1])
        res.append(vc[2])
        res.append(vc[3])
        i += 4
    while i < n:
        res.append(a[i] + b[i])
        i += 1
    return res^

def simd_sum_i32(a: List[Int]) -> Int:
    var n = len(a)
    var total = 0
    var i = 0
    while i + 4 <= n:
        var v = SIMD[DType.int32, 4](Int32(a[i]), Int32(a[i+1]), Int32(a[i+2]), Int32(a[i+3]))
        total += Int(v.reduce_add())
        i += 4
    while i < n:
        total += a[i]
        i += 1
    return total

def simd_max_i32(a: List[Int]) -> Int:
    var n = len(a)
    if n == 0:
        return 0
    var max_val = a[0]
    var i = 0
    while i + 4 <= n:
        var v = SIMD[DType.int32, 4](Int32(a[i]), Int32(a[i+1]), Int32(a[i+2]), Int32(a[i+3]))
        var v_max = Int(v.reduce_max())
        if v_max > max_val:
            max_val = v_max
        i += 4
    while i < n:
        if a[i] > max_val:
            max_val = a[i]
        i += 1
    return max_val

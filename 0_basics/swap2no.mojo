# Swap Two Numbers using different techniques

def swap_xor(mut a: Int, mut b: Int) -> List[Int]:
    a = a ^ b
    b = a ^ b
    a = a ^ b
    var res = List[Int]()
    res.append(a)
    res.append(b)
    return res^

def swap_arithmetic(mut a: Int, mut b: Int) -> List[Int]:
    a = a + b
    b = a - b
    a = a - b
    var res = List[Int]()
    res.append(a)
    res.append(b)
    return res^

def swap_temp(a: Int, b: Int) -> List[Int]:
    var res = List[Int]()
    res.append(b)
    res.append(a)
    return res^

def main():
    var x = 100
    var y = 50
    print("Initial values:", x, y)

    var res_xor = swap_xor(x, y)
    print("After swap XOR:", res_xor[0], res_xor[1])

    var res_arith = swap_arithmetic(x, y)
    print("After swap arithmetic:", res_arith[0], res_arith[1])

    var res_temp = swap_temp(x, y)
    print("After swap temp:", res_temp[0], res_temp[1])

/*
2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり, そのような数字の中では最小の値である.
では, 1 から 20 までの整数全てで割り切れる数字の中で最小の正の数はいくらになるか.
*/

func gcd(a: UInt, b: UInt) -> UInt {
    if b == 0 {
        return a
    } else {
        return gcd(a: b, b: a % b)
    }
}

func lcm(a: UInt, b: UInt) -> UInt {
    return a * b / gcd(a: a, b: b)
}

func p005_sub(a: UInt, b: UInt, c: UInt) -> UInt {
    if b == c {
        return a
    } else {
        return p005_sub(a: lcm(a: a, b: b), b: b + 1, c: c)
    }
}

func p005() -> UInt {
    return p005_sub(a: 1, b: 1, c: 20)
 }

print("\(p005())")

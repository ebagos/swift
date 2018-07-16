/*
n × (n - 1) × ... × 3 × 2 × 1 を n! と表す.

例えば, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800 となる.
この数の各桁の合計は 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27 である.

では, 100! の各桁の数字の和を求めよ.
*/
func factorial(n: UInt64, ans: UInt64) -> UInt64 {
    if n == 0 {
        return ans
    }
    return factorial(n: n - 1, ans: ans * n)
}

func nsum(n: UInt64, sum: UInt64) -> UInt64 {
    if n == 0 {
        return sum
    } else {
        return nsum(n: n / 10, sum: sum + n % 10)
    }
}


let max1 = UInt64(10)
let max2 = UInt64(100)

print("\(max1) => \(factorial(n: max1, ans: 1))")
print("\(max1) => \(nsum(n: factorial(n: max1, ans: 1), sum: 0))")

print("\(max2) => \(factorial(n: max2, ans: 1))")
print("\(max2) => \(nsum(n: factorial(n: max2, ans: 1), sum: 0))")

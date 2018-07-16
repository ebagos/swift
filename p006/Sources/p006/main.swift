/*
最初の10個の自然数について, その二乗の和は,
1^2 + 2^2 + ... + 10^2 = 385

最初の10個の自然数について, その和の二乗は,
(1 + 2 + ... + 10)^2 = 3025

これらの数の差は 3025 - 385 = 2640 となる.

同様にして, 最初の100個の自然数について二乗の和と和の二乗の差を求めよ.
*/

func powsum(n: UInt, sum: UInt) -> UInt {
    if n == 0 {
        return sum
    } else {
        return powsum(n: n - 1, sum: sum + n * n)
    }
}

func sumpow(n: UInt, sum: UInt) -> UInt {
    if n == 0 {
        return sum * sum
    } else {
        return sumpow(n: n - 1, sum: sum + n)
    }
}

let max = UInt(100)
let sum1 = sumpow(n: max, sum: 0)
let sum2 = powsum(n: max, sum: 0)
print("\(max) => \(sum1) - \(sum2) = \(sum1 - sum2)")
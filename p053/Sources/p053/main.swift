/*
12345から3つ選ぶ選び方は10通りである.
123, 124, 125, 134, 135, 145, 234, 235, 245, 345.

組み合わせでは, 以下の記法を用いてこのことを表す: 5C3 = 10.

一般に, r ≤ n について nCr = n!/(r!(n-r)!) である. ここで, n! = n×(n−1)×...×3×2×1, 0! = 1 と階乗を定義する.

n = 23 になるまで, これらの値が100万を超えることはない: 23C10 = 1144066.

1 ≤ n ≤ 100 について, 100万を超える nCr は何通りあるか?
*/
/*
nが20を超えた時点で64ビットの幅を超えるので工夫が必要
*/
func factorial(_ n: Int, _ rc: Int) -> Int {
    if n == 1 {
        return rc
    } else {
        return factorial(n - 1, rc * n)
    }
}

func main() {
    var result = 0
    for n in 1...100 {
        for r in 1...n {
            let x = factorial(n, 1) / (factorial(r, 1) * factorial(n - r, 1))
            if x > 1_000_000 {
                result += 1
            }
        }
    }
    print(result)
}

main()

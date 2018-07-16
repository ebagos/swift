/*
2^15 = 32768 であり, 各位の数字の和は 3 + 2 + 7 + 6 + 8 = 26 となる.

同様にして, 2^1000 の各位の数字の和を求めよ.
*/
let MAX = 500

func main() {
    var num: [Int] = Array(repeating: 0, count: MAX)
    var sum = 0
    num[0] = 1
    for _ in 1..<1001 {
        num = num.map {$0 * 2}
/*
        for j in 0..<MAX {
            num[j] *= 2
        }
*/
        for j in 0..<MAX - 1 {
            num[j+1] += num[j] / 10
            num[j] %= 10
        }
    }

    for j in 0..<MAX {
        print("\(num[MAX - 1 - j])", terminator: "")
    }
    print("\n")

    for j in 0..<MAX {
        sum += num[j]
    }

    print("sum=\(sum)")
    print("answer=\(num.reduce(0, +))")
}

main()

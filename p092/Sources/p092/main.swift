/*
各桁の2乗を足し合わせて新たな数を作ることを, 同じ数が現れるまで繰り返す.

例えば

　　44 → 32 → 13 → 10 → 1 → 1
　　85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

のような列である. どちらも1か89で無限ループに陥っている.
驚くことに, どの数から始めても最終的に1か89に到達する.

では, 10,000,000より小さい数で89に到達する数はいくつあるか.
*/

func keta_square(_ n: Int) -> Int {
    var result = 0
    var x = n
    while  x != 0 {
        result += (x % 10) * (x % 10)
        x /= 10
    }
    return result
}

func main() {
    var count = 0
    let MAX = 9 * 9 * 7 + 1
    var memo = Array(repeating: -1, count: MAX)
    memo[1] = 0
    memo[89] = 1
    for i in 2...10_000_000 - 1 {
        var n = i
        while true {
            n = keta_square(n)
            if memo[n] != -1 {
                break
            }
        }
        if memo[n] == 1 {
            count += 1
            if i < MAX {
                memo[i] = 1
            }
        } 
        else if i < MAX {
            memo[i] = 0
        }
    }
    print(count)
}

main()

/*
5桁の数 16807 = 7^5は自然数を5乗した数である. 同様に9桁の数 134217728 = 8^9も自然数を9乗した数である.

自然数を n 乗して得られる n 桁の正整数は何個あるか?
*/
let MAX = 30

func power(_ n: Int, _ x: Int) -> [Int] {
    var result = Array(repeating: 0, count: MAX)
    result[0] = 1
    for _ in 1...x {
        for i in 0...MAX - 1 {
            result[i] *= n
        }
        for i in 0...MAX - 2 {
            let tmp = result[i] / 10
            result[i] %= 10
            result[i+1] += tmp
        }
    }
    return result
}

func count(_ n: [Int]) -> Int {
    var count = 0
    for i in (0...MAX - 1).reversed() {
        if n[i] == 0 {
            count += 1
        } else {
            break
        }
    }
    return MAX - count
}

func get_limit() -> Int {
    var beki = 1
    while count(power(9, beki)) >= beki {
        beki += 1
    }
    return beki
}

func main() {
    var cnt = 0
    for i in 1...9 {
        for beki in 1...get_limit() {
            let tgt = power(i, beki)
            if count(tgt) == beki {
                cnt += 1
            }
        }
    }
    print(cnt)
}

main()

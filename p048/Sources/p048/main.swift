/*
 次の式は, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317 である.

では, 1^1 + 2^2 + 3^3 + ... + 1000^1000 の最後の10桁を求めよ.
*/

let MAX: Int = 11

func plus(_ a: [Int], _ b: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: MAX)
    for i in 0...MAX - 1 {
        result[i] = a[i] + b[i]
    }
    for i in 0...MAX - 2 {
        let tmp = result[i] / 10
        result[i] %= 10
        result[i+1] += tmp
    }
    result[MAX - 1] %= 10
    return result
}

func self_power(_ n: Int) -> [Int] {
    var result = Array(repeating: 0, count: MAX)
    result[0] = 1
    for _ in 1...n {
        for j in 0...MAX - 1 {
            result[j] *= n
        }
        for j in 0...MAX - 2 {
            let tmp = result[j] / 10
            result[j] %= 10
            result[j+1] += tmp
        }
        result[MAX - 1] %= 10
    }
    return result
}

func main() {
    var result = Array(repeating:0, count:MAX)
    for i in 1...1000 {
        result = plus(result, self_power(i))
    }
    for i in (0...9).reversed() {
        print(result[i], terminator: "")
    }
    print("")
}

main()

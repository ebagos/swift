/*
47とその反転を足し合わせると, 47 + 74 = 121となり, 回文数になる.

全ての数が素早く回文数になるわけではない. 349を考えよう,

    349 + 943 = 1292,
    1292 + 2921 = 4213
    4213 + 3124 = 7337

349は, 3回の操作を経て回文数になる.

まだ証明はされていないが, 196のようないくつかの数字は回文数にならないと考えられている. 反転したものを足すという操作を経ても回文数にならないものをLychrel数と呼ぶ. 先のような数の理論的な性質により, またこの問題の目的のために, Lychrel数で無いと証明されていない数はLychrel数だと仮定する.

更に, 10000未満の数については，常に以下のどちらか一方が成り立つと仮定してよい.

    50回未満の操作で回文数になる
    まだ誰も回文数まで到達していない

実際, 10677が50回以上の操作を必要とする最初の数である: 4668731596684224866951378664 (53回の操作で28桁のこの回文数になる).

驚くべきことに, 回文数かつLychrel数であるものが存在する. 最初の数は4994である.

10000未満のLychrel数の個数を答えよ.
*/
let MAX = 50

func plus(_ a: [Int], _ b: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: MAX)

    for i in 0...MAX - 1 {
        result[i] = a[i] + b[i]
    }
    for i in 0...MAX - 2 {
        let tmp = result[i] / 10
        result[i] %= 10
        result[i + 1] += tmp
    }
    return result
}

func make_array(_ n: Int) -> [Int] {
    var result = Array(repeating: 0, count: MAX)
    var r = n
    for i in 0...MAX - 1 {
        if r == 0 {
            break
        }
        result[i] = r % 10
        r /= 10
    }
    return result
}

func reverse(_ n: [Int]) -> [Int] {
    var checker = 0
    for i in 0...MAX - 1 {
        if n[i] != 0 {
            checker = i
        }
    }
    let v = Array(n.prefix(checker+1))
    let r = Array(v.reversed())
    var result = Array(repeating: 0, count: MAX)
    for i in 0...r.count - 1 {
        result[i] = r[i]
    }
    return result
}

func rcheck(_ n: [Int]) -> Bool {
    var checker = 0
    for i in 0...MAX - 1 {
        if n[i] != 0 {
            checker = i
        }
    }
    let v = Array(n.prefix(checker+1))
    if v == v.reversed() {
        return true
    }
    return false
}

func is_lychrel(_ n: Int) -> Bool {
    var c = make_array(n)
    for _ in 1...50 {
        c = plus(c, reverse(c))
        if rcheck(c) {
            return false
        }
    }
    return true
}

func main() {
    var result: Array<Int> = []
    for i in 1...10000 {
        if is_lychrel(i) {
            result.append(i)
        }
    }
    print(result)
    print(result.count)
}

/*
let n = 1234567890
let s = String(String(n).reversed())
let x = Int(s)!
print(x)

let z = [1,2,3,4,5,6,7,8,9]
let zz = Array(z.reversed())
print(zz)
print(z == zz.reversed())

print(make_array(345))
*/

main()

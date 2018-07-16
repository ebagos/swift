/*2の平方根は無限に続く連分数で表すことができる.
√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

最初の4回の繰り返しを展開すると以下が得られる.

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

次の3つの項は99/70, 239/169, 577/408である. 第8項は1393/985である. これは分子の桁数が分母の桁数を超える最初の例である.

最初の1000項を考えたとき, 分子の桁数が分母の桁数を超える項はいくつあるか?
*/

/*
分母は1つ前の項の分母+分子、分子は1つ前の項の分母*2+分子
*/
let MAX = 1000
func make_array(_ n: Int) -> [Int] {
    var result = Array(repeating: 0, count: MAX)
    var x = n
    for i in 0...MAX - 1 {
        result[i] = x % 10
        x /= 10
        if x == 0 {
            break
        }
    }
    return result
}

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
    return result
}

func double(_ n: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: MAX)
    for i in 0...MAX - 1 {
        result[i] = n[i] * 2
    }
    for i in 0...MAX - 2 {
        let tmp = result[i] / 10
        result[i] %= 10
        result[i+1] += tmp
    }
    return result
}

func count(_ n: [Int]) -> Int {
    var count = 0
    for i in 0...MAX - 1 {
        if n[i] != 0 {
            count = i
        }
    }
    return count
}

func main() {
    var bunshi = make_array(3)
    var bunbo = make_array(2)
    var koeta = 0
    for _ in 1...999 {
        let nbunbo = plus(bunshi, bunbo)
        let nbunshi = plus(double(bunbo), bunshi)
        if count(nbunbo) < count(nbunshi) {
            koeta += 1
        }
        bunbo = nbunbo
        bunshi = nbunshi
    }
    print(koeta)
}

main()

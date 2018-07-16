/*
Googol (10100)は非常に大きな数である: 1の後に0が100個続く. 100100は想像を絶する. 1の後に0が200回続く. その大きさにも関わらず, 両者とも数字和 ( 桁の和 ) は1である.

a, b < 100 について自然数 ab を考える. 数字和の最大値を答えよ.
*/
/*
桁あふれしてしまう
*/

let MAX = 202
func make_array(_ n: Int) -> [Int] {
    var x = n
    var result = Array(repeating: 0, count: MAX)
    for i in 0...MAX - 1 {
        result[i] = x % 10
        x /= 10
        if x == 0 {
            break
        }
    }
    return result
}

func pow(_ n: Int, _ x: Int) -> Int {
    var result = 1
    for _ in 1...x {
        result *= n
    }
    return result
}

func apower(_ n: Int) -> [Int] {
    var result = make_array(n)
    for _ in 1...n {
        for j in 0...MAX - 1 {
            for k in 0...MAX - 1 {
                let tmp = result[k]
                result[k] += tmp * result[j] * pow(10, k)
            }
        }
        for j in 0...MAX - 2 {
            let tmp = result[j] / 10
            result[j] %= 10
            result[j+1] += tmp
        }
    }
    return result
}

print(apower(11))

/*
完全数とは, その数の真の約数の和がそれ自身と一致する数のことである. たとえば, 28の真の約数の和は, 1 + 2 + 4 + 7 + 14 = 28 であるので, 28は完全数である.

真の約数の和がその数よりも少ないものを不足数といい, 真の約数の和がその数よりも大きいものを過剰数と呼ぶ.

12は, 1 + 2 + 3 + 4 + 6 = 16 となるので, 最小の過剰数である. よって2つの過剰数の和で書ける最少の数は24である. 数学的な解析により, 28123より大きい任意の整数は2つの過剰数の和で書けることが知られている. 2つの過剰数の和で表せない最大の数がこの上限よりも小さいことは分かっているのだが, この上限を減らすことが出来ていない.

2つの過剰数の和で書き表せない正の整数の総和を求めよ.
*/

func make_divisor_list(_ num: Int) -> [Int] {
    var rc = make_true_divisor_list(num)
    rc.append(num)
    return rc
}

func make_true_divisor_list(_ num: Int) -> [Int] {
    if num < 1 {
        return []
    } else if num == 1 || num == 2 || num == 3 {
        return [1]
    } else {
        var divisor_list: [Int] = []
        divisor_list.append(1)
        for i in 2...num / 2 {
            if num % i == 0 {
                divisor_list.append(i)
            }
        }
//        divisor_list.append(num)
        return divisor_list
    }
}

func is_over(_ num: Int) -> Bool {
    var rc = false
    let a = make_true_divisor_list(num)
    if a.reduce(0, +) > num {
        rc = true
    } else {
        rc = false
    }
    return rc
}

var ar: [Int] = []
var dict: [Int:Bool] = [:]
for i in 1...28123 {
    let rc = is_over(i)
    dict[i] = rc
    if rc {
        ar.append(i)
    }
}
for x in ar {
    for y in ar {
        dict[x+y] = true
    }
}
var sum = 0
for i in 1...28123 {
    if dict[i] == false {
        sum += i
    }
}

print(sum)
//NG

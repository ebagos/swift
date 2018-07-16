/*
d(n) を n の真の約数の和と定義する. (真の約数とは n 以外の約数のことである. )
もし, d(a) = b かつ d(b) = a (a ≠ b のとき) を満たすとき, a と b は友愛数(親和数)であるという.

例えば, 220 の約数は 1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110 なので d(220) = 284 である.
また, 284 の約数は 1, 2, 4, 71, 142 なので d(284) = 220 である.

それでは10000未満の友愛数の和を求めよ.
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

func is_friend(_ num: Int) -> Bool {
    let a = make_true_divisor_list(num)
    let fa = a.reduce(0, +)
    if fa == num {
        return false
    }
    let b = make_true_divisor_list(fa)
    let fb = b.reduce(0, +)
    if fb == num {
        return true
    }
    return false
}

var sum = 0
for i in 1...10000 - 1 {
    if is_friend(i) {
        sum += i
    }
}
print(sum)

/*
145は面白い数である. 1! + 4! + 5! = 1 + 24 + 120 = 145となる.

各桁の数の階乗の和が自分自身と一致するような数の和を求めよ.

注: 1! = 1 と 2! = 2 は総和に含めてはならない.
*/

/*
この方法はlimit()で示す検索範囲が大きすぎるため処理時間がかかる
*/

func fill(_ n: UInt, _ c: UInt, _ rc: UInt) -> UInt {
    if c == 0 {
        return rc
    } else {
        return fill(n, c - 1, rc * 10 + n)
    }
}

func factorial(_ n: UInt, _ rc: UInt) -> UInt {
    if n == 0 {
        return rc
    } else {
        return factorial(n - 1, rc * n)
    }
}

func get_limit() -> UInt {
    let MAX: UInt = 100
    var tmp: UInt = 0
    for i in 1...MAX {
        tmp = i * factorial(9, 1)
        if fill(9, i, 0) > tmp {
            break
        }
    }
    return tmp
}

func facto_sum(_ n: UInt, _ rc: UInt) -> UInt {
    if n == 0 {
        return rc
    } else {
        return facto_sum(n / 10, rc + factorial(n % 10, 1))
    }
}

func main() {
    var rc: Array<UInt> = []

    for i: UInt in 3...get_limit() {
        if facto_sum(i, 0) == i {
            rc.append(i)
        }
    }

    print(rc.reduce(0, +))
}

main()

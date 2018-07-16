/*
素数を小さい方から6つ並べると 2, 3, 5, 7, 11, 13 であり, 6番目の素数は 13 である.

10 001 番目の素数を求めよ.
*/
func is_prime(_ num: Int) -> Bool {
    var yaku = 0
    for dv in 1...num {
        if num % dv == 0 {
            yaku += 1
        }
    }
    if yaku == 2 {
        return true
    } else {
        return false
    }
}

func generate_primes(_ n: Int) -> [Int] {
    var primes = [2]
    var i = 3
    while primes.count < n {
        if is_prime(i) == true {
            primes.append(i)
        }
        i += 2
    }
    return primes
}

func main() {
    let result = generate_primes(10001)
    print(result[result.count - 1])
}

main()

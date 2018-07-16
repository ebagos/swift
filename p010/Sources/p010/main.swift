/*
10以下の素数の和は 2 + 3 + 5 + 7 = 17 である.

200万以下の全ての素数の和を求めよ.
*/
func is_prime(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    if num == 2 || num == 3 || num == 5 {
        return true
    }
    if num % 2 == 0 || num % 3 == 0 || num % 5 == 0 {
        return false
    }
    var prime = 7
    var step = 4
    let num_sqrt = Int(Double(num).squareRoot())
    while prime <= num_sqrt {
        if num % prime == 0 {
            return false
        }
        prime += step
        step = 6 - step
    }
    return true
}

func make_prime_list(_ num: Int) -> [Int] {
    if num < 2 {
        return []
    }
    var prime_list = Array(repeating: 0, count: num+1)
    for i in 1...num {
        prime_list[i] = i
    }
    prime_list[1] = 0
    let num_sqrt = Int(Double(num).squareRoot())
    for prime in prime_list {
        if prime == 0 {
            continue
        }
        if prime > num_sqrt {
            break
        }
        for non_prime in stride(from: 2 * prime, to: num+1, by: prime) {
            prime_list[non_prime] = 0
        }
    }
    var result: [Int] = []
    for i in prime_list {
        if i != 0 {
            result.append(i)
        }
    }
    return result
}

print(make_prime_list(10))
let result = make_prime_list(2_000_000)
print(result.reduce(0, +))

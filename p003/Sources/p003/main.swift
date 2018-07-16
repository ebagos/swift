/*
13195 の素因数は 5, 7, 13, 29 である
600851475143 の素因数のうち最大のものを求めよ
*/
func factor_sub(n: UInt64, result: UInt64) -> UInt64 {
    if result * result > n {
        if n == 1 {
            return result
        } else {
            return n
        }
    }
    if n % result == 0 {
        return factor_sub(n: n / result, result: result)
    } else {
        return factor_sub(n: n, result: result + 1)
    }
}

func factor(n: UInt64) -> UInt64{
    return factor_sub(n: n, result: 2)
}

print("600851475143の最大の素因数 = \(factor(n: 600851475143))")

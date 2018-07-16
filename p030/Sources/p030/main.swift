/*
驚くべきことに, 各桁を4乗した数の和が元の数と一致する数は3つしかない.

    1634 = 1**4 + 6**4 + 3**4 + 4**4
    8208 = 8**4 + 2**4 + 0**4 + 8**4
    9474 = 9**4 + 4**4 + 7**4 + 4**4

ただし, 1=1**4は含まないものとする. この数たちの和は 1634 + 8208 + 9474 = 19316 である.

各桁を5乗した数の和が元の数と一致するような数の総和を求めよ.
*/
/*
なお、本プログラムには問題が内包されている。
その問題を指摘し修正せよ。
*/

func powi(x: UInt32, n: UInt32, base: UInt32) -> UInt32 {
    if n == 0 {
        return base
    } else {
        return powi(x: x, n: n - 1, base: base * x)
    }
}

func calc(x: UInt32, n: UInt32, base: UInt32) -> UInt32 {
    if x < 10 {
        return base + powi(x: x, n: n, base: 1)
    } else {
        return calc(x: x / 10, n: n, base: powi(x: x % 10, n: n, base: 1) + base)
    }
}

for i: UInt32 in 2...999999 {
    if i == calc(x: i, n: 5, base: 0) {
        print(i)
    }
}
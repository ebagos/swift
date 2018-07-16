/*
ピタゴラス数(ピタゴラスの定理を満たす自然数)とは a < b < c で以下の式を満たす数の組である.

a^2 + b^2 = c^2
例えば, 3^2 + 4^2 = 9 + 16 = 25 = 5^2 である.

a + b + c = 1000 となるピタゴラスの三つ組が一つだけ存在する.
これらの積 abc を計算しなさい.
*/
var result: [(Int, Int, Int)] = []
for b in 1...998 {
    for a in 1...b {
        let c = 1000 - a - b
        if a * a + b * b == c * c {
            result.append((a, b, c))
        }
    }
}
print(result)

/*
  左右どちらから読んでも同じ値になる数を回文数という.
  2桁の数の積で表される回文数のうち, 最大のものは 9009 = 91 × 99 である.
  では, 3桁の数の積で表される回文数の最大値を求めよ.
*/

// 数値並びを逆にした数値をつくる
func reverse(org: UInt, dst: UInt) -> UInt {
    if org == 0 {
        return dst
    }
    return reverse(org: org / 10, dst: dst * 10 + (org % 10))
}

func my() -> UInt{
    var result = UInt(0)
    for i in (100...999).reversed() {
        for j in (i...999).reversed() {
            let m: UInt = UInt(i * j)
            if m == reverse(org: m, dst: 0) {
                if result < m {
                    result = m
                }
                print("\(i) x \(j) = \(m) : reverse = \(reverse(org: m, dst: 0))")
                break
            }
//          print("\(i) : \(j) = \(m) => \(reverse(org: m, dst: 0))")
        }
    }
    return result
}

let result = my()
if result != 0 {
    print("result = \(result)")
}

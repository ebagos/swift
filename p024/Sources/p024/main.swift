/*
順列とはモノの順番付きの並びのことである. たとえば, 3124は数 1, 2, 3, 4 の一つの順列である. すべての順列を数の大小でまたは辞書式に並べたものを辞書順と呼ぶ. 0と1と2の順列を辞書順に並べると
012 021 102 120 201 210
になる.

0,1,2,3,4,5,6,7,8,9からなる順列を辞書式に並べたときの100万番目はいくつか?
*/

var v: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var ar: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

func subfact(n: Int, rc: Int) -> Int {
    if (n == 1) {
        return rc
    }
    return subfact(n: n - 1, rc: rc * n)
}

func fact(n: Int) -> Int {
    if n <= 0 {
        return 1
    }
    return subfact(n:n, rc:1)
}

func miso(n: Int, x: Int, lft: Int) {
    let k = fact(n: n - 1)
    let idx = x / k
    let am = x % k

    ar[lft] = v[idx]
    v.remove(at: idx)

    if n == 1 {
        return
    }
    miso(n: n - 1, x: am, lft: lft + 1)
}

miso(n: 10, x: 1_000_000 - 1, lft: 0)
var ans = 0
for i in 0...9 {
    ans = ans * 10 + ar[i]
}
print(ans)

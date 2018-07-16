/*
フィボナッチ数列は以下の漸化式で定義される:

Fn = Fn-1 + Fn-2, ただし F1 = 1, F2 = 1.
最初の12項は以下である.

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
12番目の項, F12が3桁になる最初の項である.

1000桁になる最初の項の番号を答えよ.
*/
let MAXCOL = 1000
var f1 = Array(repeating:0, count: 1001)
var f2 = Array(repeating:0, count: 1001)
var f3 = Array(repeating:0, count: 1001)

f1[0] = 1
f2[0] = 1
var num = 2
while true {
    for i in 0...MAXCOL {
        f3[i] = f1[i] + f2[i]
    }
    num += 1
    for i in 0...MAXCOL-1 {
        let tmp = f3[i] / 10
        f3[i] %= 10
        f3[i+1] += tmp

        f1[i] = f2[i]
        f2[i] = f3[i]
    }
    if f3[999] != 0 {
        break
    }
}
print(num)

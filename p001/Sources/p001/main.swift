/*
    1から999までの配列（1...999で表現）に対して、
    3または5で割り切れるか要素を抽出し（filter）、
    その合計を算出する(reduce）
*/
print((1...999).filter{$0 % 3 == 0 || $0 % 5 == 0}.reduce(0){(num1, num2) -> Int in num1 + num2})

/*
    理解しやすいように分解（reduceは省略形を使って)
    コンパイラが最適化してくれると思うが、filteredが実際に生成されないか気になる
*/
let array = 1...999
let filtered = array.filter{$0 % 3 == 0 || $0 % 5 == 0}
let reduced = filtered.reduce(0){$0 + $1}
print(reduced)

/*
    filterに関数を渡す & reduceをもっと簡単に表現
*/
func myFilter(n: Int) -> Bool {
    return (n % 3 == 0 || n % 5 == 0)
}

let filtered2 = array.filter(myFilter)
print(filtered2.reduce(0, +))

// 1...999が実際にメモリを割り当てた配列で初期化されるか気にはなる
// つまり遅延評価か否か
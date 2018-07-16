/*
125874を2倍すると251748となる. これは元の数125874と順番は違うが同じ数を含む.

2x, 3x, 4x, 5x, 6x が x と同じ数を含むような最小の正整数 x を求めよ.
*/
func check(_ n: Int, _ m: Int) -> Bool {
    if (String(n).sorted()) == (String(m).sorted()) {
        return true
    } else {
        return false
    }
}

func main() {
    var n = 1
    while !(check(n, n * 2) && check(n, n * 3) && check(n, n * 4) && check(n, n * 5) && check(n, n * 6)) {
        n += 1
    }
    print(n)
}

main()

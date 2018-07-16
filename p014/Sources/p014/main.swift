func collatz(n: Int) -> Int {
    var count = 1
    var m = n
    while m > 1 {
        if m % 2 == 0 {
            m = m / 2
        } else {
            m = m * 3 + 1
        }
        count += 1
    }
    return count
}

var max = 0
var key = 0

for i in 2...1000000 {
    let rc = collatz(n:i)
    if max < rc {
        max = rc
        key = i
    }
}
print("key = \(key) max = \(max)")

/*
func myfunc(n: Int, max: Int, key: Int) -> (Int, Int) {
    if (n == 1) {
        return (max, key)
    } else {
        let rc = collatz(n: n)
        if (max < rc) {
            return myfunc(n: n-1, max: rc, key: n)
        } else {
            return myfunc(n: n-1, max: max, key: key)
        }
    }
}

print("(max, key)=\(myfunc(n: 1000000, max: 0, key: 0))")
*/

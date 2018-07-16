func sub1() -> Int {
    var sum = 0;
    for i in 1...999 {
        if (i % 3 == 0) || (i % 5 == 0) {
            sum += i;
        }
    }
    return sum;
}

func sub2(n: Int, sum: Int) -> Int {
    if n == 1 {
        return sum
    }
    if (n % 3 == 0) || (n % 5 == 0) {
        return sub2(n:n-1, sum:sum+n)
    }
    return sub2(n:n-1, sum:sum)
}

func sub3() -> Int {
    return (1...999).filter{($0 % 3 == 0) || ($0 % 5 == 0)}.reduce(0, +)
}
print("Hello, world!")
print("sum = \(sub1())")
print("sum = \(sub2(n:999, sum:0))")
print("sum = \(sub3())")

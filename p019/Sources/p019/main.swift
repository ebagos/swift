/*
次の情報が与えられている.

1900年1月1日は月曜日である.
9月, 4月, 6月, 11月は30日まであり, 2月を除く他の月は31日まである.
2月は28日まであるが, うるう年のときは29日である.
うるう年は西暦が4で割り切れる年に起こる. しかし, 西暦が400で割り切れず100で割り切れる年はうるう年でない.
20世紀（1901年1月1日から2000年12月31日）中に月の初めが日曜日になるのは何回あるか?
*/
let days_of_month = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
func is_uru(_ year: Int) -> Int {
    var rc = 0
    if year % 4 == 0 {
        rc = 1
        if year % 100 == 0 && year % 400 != 0 {
            rc = 0
        }
    }
    return rc
}

func is_next_sunday(_ days: Int) -> Bool {
    var rc = false
    if days % 7 == 6 {
        rc = true
    } else {
        rc = false
    }
    return rc
}

var count = 0
var days = days_of_month.reduce(0, +) + is_uru(1900)
if is_next_sunday(days) {
    count += 1
}
for year in 1901...2000 {
    for month in 1...12 {
        days += days_of_month[month]
        if month == 2 {
            days += is_uru(year)
        }
        if is_next_sunday(days) {
            if !(year == 2000 && month == 12) {
                count += 1
            }
        }
    }
}
print(count)

/*
1 から 5 までの数字を英単語で書けば one, two, three, four, five であり, 全部で 3 + 3 + 5 + 4 + 4 = 19 の文字が使われている.

では 1 から 1000 (one thousand) までの数字をすべて英単語で書けば, 全部で何文字になるか.

注: 空白文字やハイフンを数えないこと. 例えば, 342 (three hundred and forty-two) は 23 文字, 115 (one hundred and fifteen) は20文字と数える. なお, "and" を使用するのは英国の慣習.
*/
let numbers = [
    1:"one", 2:"two", 3:"three", 4:"four", 5:"five",
    6:"six", 7:"seven", 8:"eight", 9:"nine", 10:"ten",
    11:"eleven", 12:"twelve", 13:"thirteen", 14:"fourteen", 15:"fifteen",
    16:"sixteen", 17:"seventeen", 18:"eighteen", 19:"nineteen", 20:"twenty",
    30:"thirty", 40:"forty", 50:"fifty", 60:"sixty", 70:"seventy", 80:"eighty",
    90:"ninety", 1000:"onethousand"
]

func number_to_word(_ num: Int) -> String {
    if numbers[num, default: ""] != "" {
        return numbers[num]!
    } else if num < 100 {
        let a = num % 10
        let b = (num / 10) * 10
//        return number_to_word(b) + "-" + number_to_word(a)
        return number_to_word(b) + number_to_word(a)
    } else {
        let a = num % 100
        let b = num / 100
        if a == 0 {
            return number_to_word(b) + "handred"
        } else {
            return number_to_word(b) + "handredand" + number_to_word(a)
        }
    }
}

func to_character_num(_ word: String) -> Int {
    let len = word.count
    var count = 0
    for i in word {
        if i == " " || i == "-" {
            count += 1
        }
    }
    return len - count
//    return word.map{$0 == " " ? "" :String($0)}.map{$0 == "-" ? "" : $0}.count
}

var words = ""
for i in 1...1000 {
    words += number_to_word(i)
}
print(to_character_num(words))

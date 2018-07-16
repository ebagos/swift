/*
以下の4言語、4つの挨拶を対話的に表示するプログラムを作成せよ

| 　　 |  日本語   |     英語      | フランス語  |    ドイツ語      |
|:---:|:--------:|:------------: |:---------:|:--------------:|
| 朝　 | おはよう　 | Good moring  |  Bonjour  |  Guten Morgen   |
| 昼　 | こんにちは |    Hello     |  Bonjour  |    Guten Tag    |
| 夜　 | こんばんは | Good evening |  Bonsoir  |   Guten Abend   |
| 別れ | さようなら |   Good-by    | Au revoir | Auf Wiedersehen |

プログラムは、
1. 最初の入力で言語選択
1. 次の選択でシチュエーション選択
1. 最初に戻る、または終了

- ユーザインタフェースはご自由に！
- 拡張性を考慮すること
*/
import Glibc

let ja = ["おはよう", "こんにちは", "こんばんは", "さようなら"]
let en = ["Good moring", "Hello", "Good evening", "Good-by"]
let fr = ["Bonjour", "Bonjour", "Bonsoir", "Au revoir"]
let gr = ["Guten Morgen", "Guten Tag", "Guten Abend", "Auf Wiedersehen"]

let ja_name = "日本語"
let en_name = "English"
let fr_name = "Français"
let gr_name = "Deutsch"

let messages = [ja, en, fr, gr]
let lang_name = [ja_name, en_name, fr_name, gr_name]

// 本来なら厳密な処理が必要だけど、ここでは超簡単にする
func get_string() -> String {
    if let s = readLine() {
        return s
    } else {
        return ""
    }
}

func get_id(title: String, disp: Array<String>) -> Int {
    while (true) {
        print("select \(title)")
        for ln in 0..<disp.count {
            print("\(disp[ln]) = \(ln+1), ", terminator: "")
        }
        print("end = 9 : ", terminator: "")
        if let rc = Int(get_string()) {
            if rc > 0 && rc <= disp.count {
                return rc
            } else if rc == 9 {
                return rc
            } else {
                continue
            }
        } else {
            continue
        }
    }
}

while true {
    let lang_id = get_id(title: "Language", disp: lang_name)
    if lang_id == 9 {
        break
    }
    let mes_id = get_id(title: "Message", disp: messages[lang_id-1])
    if mes_id == 9 {
        break
    }
    print("\(messages[lang_id-1][mes_id-1])")
}

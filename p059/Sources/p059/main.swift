/*
各文字はそれぞれ一意のコードに割り当てられている. よく使われる標準としてASCII (American Standard Code for Information Interchange) がある. ASCIIでは, 大文字A = 65, アスタリスク (*) = 42, 小文字k = 107というふうに割り当てられている.

モダンな暗号化の方法として, テキストファイルの各バイトをASCIIに変換し, 秘密鍵から計算された値とXORを取るという手法がある. XOR関数の良い点は, 暗号化に用いたのと同じ暗号化鍵でXORを取ると平文を復号できる点である. 65 XOR 42 = 107であり, 107 XOR 42 = 65である.

破られない暗号化のためには, 鍵は平文と同じ長さのランダムなバイト列でなければならない. ユーザーは暗号文と暗号化鍵を別々の場所に保存する必要がある. また, もし一方が失われると, 暗号文を復号することは不可能になる.

悲しいかな, この手法はほとんどのユーザーにとって非現実的である. そこで, 鍵の変わりにパスワードを用いる手法が用いられる. パスワードが平文より短ければ (よくあることだが), パスワードは鍵として繰り返し用いられる. この手法では, 安全性を保つために十分長いパスワードを用いる必要があるが, 記憶するためにはある程度短くないといけない.

この問題での課題は簡単になっている. 暗号化鍵は3文字の小文字である. cipher1.txtは暗号化されたASCIIのコードを含んでいる. また, 平文はよく用いられる英単語を含んでいる. この暗号文を復号し, 平文のASCIIでの値の和を求めよ.
*/

/*
英文だからスペースが一番多いものが正解というかなりあれな根拠から解く
*/
import Glibc

func read_sub(_ fname: String) -> String {
    let FILE = fopen(fname, "r")
    guard FILE != nil else {
        fatalError("Faild to open.")
    }
    let size = 100000
    let data = UnsafeMutablePointer<CChar>.allocate(capacity: size)

    fread(data, MemoryLayout<CChar>.size, size, FILE)

    let string = String(cString: data)

    return string
}

func main() {
    let content: String = read_sub("/home/hides/Documents/projects/python/cipher1.txt")
//    let parsed: [[String]] = content.components(separatedBy: "\n").map{$0.components(separatedBy: ",")}
    let parsed = content.split(separator: "\n")
    let parsed2 = parsed.map{$0.split(separator: ",")}
    let data = parsed2[0].flatMap{Int($0)}
    let alpha = "abcdefghijklmnopqrstuvwxyz".utf8
    var mspc = 0
    var mseed: [Int] = []
    var mtext = ""
    for a0 in alpha {
        for a1 in alpha {
            for a2 in alpha {
                var spc = 0
                let seed = [Int(a0), Int(a1), Int(a2)]
                var text = ""
                for (i, x) in data.enumerated() {
                    text += "\(UnicodeScalar(x ^ seed[i % 3])!)"
                }
                for c in text {
                    if c == " " {
                        spc += 1
                    }
                }
                if mspc < spc {
                    mseed = seed
                    mtext = text
                    mspc = spc
                }
            }
        }
    }
    var sseed = ""
    for c in mseed {
        sseed += "\(UnicodeScalar(c)!)"
    }
    print("seed =", sseed)
    print(mtext)
}

main()

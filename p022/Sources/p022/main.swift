import Glibc

func read_sub(fname: String) -> String {
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

func calc(str: String, weight: UInt32) -> UInt32 {
    var sum: UInt32 = 0
    for code in str.unicodeScalars {
        sum += code.value - weight
    }
    return sum
}

// コスト高い・・・cの登場回数が多いほどrstrが作成される
func remove_sub(str: String, c: Character) -> String {
    var rstr = str
    print(rstr)
    while true {
        if let i = rstr.characters.index(of: c) {
            rstr.remove(at: i)
        } else {
            break;
        }
    }
    return rstr
}

// 拡張・・・コストが高いことには変わりがないけど
extension Substring {
    func delAll(c: Character) -> Substring {
        var result: Substring = self

        while true {
            if let i = result.characters.index(of: c) {
                result.remove(at: i)
            } else {
                break;
            }
        }
         return result
    }
}

func format(str: String) -> Array<String> {
    // 本来は文字(")を取り除く処理をするべき
    // しかし、文字列のフォーマットが未来永劫固定なら現実的な解かも
/*   
    let tmp1 = str.split(separator: ",")
    let tmp2 = tmp1.map{$0.dropFirst().dropLast().uppercased()}
    let rc = tmp2.sorted()
    return rc
*/   
    // 本来の処理
    /*
    let tmp1 = str.split(separator: ",")
    let tmp2 = tmp1.map{$0.uppercased()}
    let tmp3 = tmp2.map{remove_sub(str: $0, c: "\"")}
    let rc = tmp3.sorted()
    return rc
    */
    // 拡張を使う（コストは変わらず）
    let tmp1 = str.split(separator: ",")
    let tmp2 = tmp1.map{$0.delAll(c: "\"").uppercased()}
    let rc = tmp2.sorted()
    return rc
}
//" ← VS Codeの表示バグ対策
let string = read_sub(fname: "/home/hides/Documents/projects/cpp.old/names.txt")
let array = format(str: string)
let codea: UInt32 = calc(str: "A", weight: 0)

var sum: UInt32 = 0
var i: UInt32 = 1
for aa in array {
    sum += calc(str:aa, weight:codea-1) * i
    i += 1
}
print(sum);

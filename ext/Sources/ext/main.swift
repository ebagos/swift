/*
** Int型を拡張して、数字を逆順にするメソッドを追加する。
*/
 
extension Int {
    
    //逆順メソッド
    func reverseNumber() -> Int {
 
        var resultStr:String = ""
        
        //数字を文字列に変換し、1文字ずつループで回して逆順に結合する。
        for a in String(self).characters {
            resultStr = String(a) + resultStr
        }
        return Int(resultStr)!
    }
 
}
 
//Int型の逆順メソッドを呼び出す。
var test:Int = 123
print(test.reverseNumber())
 
//実行結果
//321
 
extension String {
    func delAll(c: Character) -> String {
        var result: String = self

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

 let str = "abcdefgababababa"
 print(str.delAll(c: "a"))
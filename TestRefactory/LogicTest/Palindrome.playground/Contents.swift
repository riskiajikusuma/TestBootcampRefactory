import UIKit

func palindrome(_ stringWord: String) -> String {
    for i in 0..<stringWord.count / 2 {
        let startIndex = stringWord.index(stringWord.startIndex, offsetBy: i)
        let endIndex = stringWord.index(stringWord.index(before: stringWord.endIndex), offsetBy: 0 - i)
        if stringWord[startIndex].lowercased() != stringWord[endIndex].lowercased() {
            return "\(stringWord) --> not palindrome"
        }
     }
    return "\(stringWord) --> palindrome"
}
print("""
\(palindrome("Radar"))
\(palindrome("Malam"))
\(palindrome("Kasur ini rusak"))
\(palindrome("Ibu Ratna antar ubi"))
\(palindrome("Malas"))
\(palindrome("Makan nasi goreng"))
\(palindrome("Balonku ada lima"))
""")

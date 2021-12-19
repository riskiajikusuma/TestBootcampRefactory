import UIKit

func reverseWords(word: String) -> String {
    var result = [Character]()
    for char in word {
        result.insert(contentsOf: char.isUppercase ? char.uppercased() : char.lowercased(), at: 0)
    }
    return String(result)
}

func reverseWordsInSentence(sentences: String) {
    let word = sentences.components(separatedBy: " ")
    var result = ""
    for word in word {
        if result != "" {
            result += " "
        }
        
        var reverse = String(reverseWords(word: word))
        if reverse[reverse.index(before: reverse.endIndex)].isUppercase {
            reverse = reverse.capitalized
        }
        
        result += reverse
    }
    
    print(result)
}

reverseWordsInSentence(sentences: "I am A Great human")
reverseWordsInSentence(sentences: "Ibu Ratna antar ubi")

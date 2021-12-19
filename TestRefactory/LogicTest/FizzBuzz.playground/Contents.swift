import UIKit

func fizzBuzz(n total: Int) -> [String] {
    var result = [String]()
    for number in 1...total {
        if number % 3 == 0 && number % 5 == 0 {
            result.append("FizzBuzz")
        } else if number % 3 == 0 {
            result.append("Fizz")
        } else if number % 5 == 0 {
            result.append("Buzz")
        } else {
            result.append(String(number))
        }
    }
    return result
}

print("n = 3 \nOutput: \(fizzBuzz(n: 3))\n")
print("n = 5 \nOutput: \(fizzBuzz(n: 5))\n")
print("n = 15 \nOutput: \(fizzBuzz(n: 15))\n")

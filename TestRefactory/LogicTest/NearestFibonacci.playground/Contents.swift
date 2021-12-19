import UIKit

func fibonacci(arr: [Int]) {
    // Penjumlahan array
    var total = 0
    for value in arr {
        total = total + value
    }
    
    // Deret fibonacci
    var fn1 = 0
    var fn2 = 1
    var fn = fn1 + fn2

    while (fn <= total) {
        fn1 = fn2
        fn2 = fn
        fn = fn1 + fn2
    }
    
    let nearestFibonacci = abs(fn - total) >= abs(fn2 - total) ? fn2 : fn
    print("Output = \(abs(nearestFibonacci - total))")
}

fibonacci(arr: [15, 1, 3])

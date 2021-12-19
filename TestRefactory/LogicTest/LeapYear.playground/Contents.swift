import UIKit

func leapYear(startYear: Int, endYear: Int) -> [Int] {
    var arr = [Int]()
    for year in startYear...endYear {
        if (year % 400 == 0) || (year % 100 != 0) && (year % 4 == 0) {
            arr.append(year)
        }
    }
    return arr
}

print(leapYear(startYear: 1900, endYear: 2020))

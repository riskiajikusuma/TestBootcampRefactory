import UIKit

struct DataModel: Decodable {
    let inventoryID: Int
    let name, type: String
    let tags: [String]
    let purchasedAt: Int
    let placement: Placement

    enum CodingKeys: String, CodingKey {
        case inventoryID = "inventory_id"
        case name, type, tags
        case purchasedAt = "purchased_at"
        case placement
    }
}

struct Placement: Decodable {
    let roomID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case roomID = "room_id"
        case name
    }
}

guard let jsonSource = Bundle.main.url(forResource: "data", withExtension: "json") else {
    fatalError("Tidak ada file data.json")
}

guard let jsonData = try? Data(contentsOf: jsonSource) else {
    fatalError("Convert data gagal")
}

guard let data = try? JSONDecoder().decode([DataModel].self, from: jsonData) else {
    fatalError("Ada masalah saat proses decode")
}

var answer1 = [String](), answer2 = [String](), answer3 = [String](), answer4 = [String](), answer5 = [String]()
for json in data {
    if json.placement.name.lowercased() == "Meeting Room".lowercased() {
        answer1.append(json.name)
    }
    
    if json.type.lowercased() == "electronic".lowercased() {
        answer2.append(json.name)
    }
    
    if json.type.lowercased() == "furniture".lowercased() {
        answer3.append(json.name)
    }
    
    let timeInterval = TimeInterval(json.purchasedAt)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MMM/YY"
    let date = Date(timeIntervalSince1970: timeInterval)
    
    if dateFormatter.string(from: date).lowercased() == "16/Jan/20".lowercased() {
        answer4.append(json.name)
    }
    
    for tag in json.tags {
        if tag.lowercased() == "brown".lowercased() {
            answer5.append(json.name)
        }
    }
}
print("Task 1 = \(answer1)")
print("Task 2 = \(answer2)")
print("Task 3 = \(answer3)")
print("Task 4 = \(answer4)")
print("Task 5 = \(answer5)")

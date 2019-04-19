
import Foundation
import RealmSwift

class Level: Object {
  @objc dynamic var name = ""
  var sections = List<Section>()
  @objc dynamic var levelID = UUID().uuidString
  @objc dynamic var difficulty = 0
  
  func add(section:Section){
    //auto increment the order
    section.orderID = sections.count
    sections.append(section)
  }
  
  override static func primaryKey() -> String? {
    return "levelID"
  }
  
  
}

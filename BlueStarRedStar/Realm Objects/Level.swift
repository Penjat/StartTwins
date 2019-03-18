
import Foundation
import RealmSwift

class Level: Object {
  @objc dynamic var name = ""
  var sections = List<Section>()
  
  func add(section:Section){
    //auto increment the order
    section.orderID = sections.count
    sections.append(section)
  }
}

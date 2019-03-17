
import Foundation
import RealmSwift

class Level: Object {
  @objc dynamic var name = ""
  var sections = List<Section>()
  
  func add(section:Section){
    sections.append(section)
  }
}

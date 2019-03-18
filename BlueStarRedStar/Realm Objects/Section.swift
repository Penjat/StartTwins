

import Foundation
import RealmSwift

class Section : Object{
  @objc dynamic var distance = 0
  @objc dynamic var speed = 0
  @objc dynamic var orderID = 0
  var segments = List<Segment>()
  
  func add(segment:Segment){
    segments.append(segment)
  }
}



import Foundation
import RealmSwift

class Segment : Object{
  @objc dynamic var height = 0
  var pieces = List<Piece>()
  
  func add(piece:Piece){
    pieces.append(piece)
  }
}

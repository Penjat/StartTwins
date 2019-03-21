

import Foundation
import RealmSwift

class Segment : Object{
  @objc dynamic var height = 0
  var pieces = List<Piece>()
  
  func add(piece:Piece){
    pieces.append(piece)
  }
  func getHeight()->CGFloat{
    
    return CGFloat(height)*StaticHelper.widthRatio
  }
}

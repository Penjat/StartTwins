

import Foundation
import RealmSwift

class Piece : Object{
  @objc dynamic var type = 0
  @objc dynamic var width = 0
  @objc dynamic var height = 0
  @objc dynamic var x = 0
  @objc dynamic var y = 0
  @objc dynamic var color = 0
  
  func getX()->CGFloat{
    return CGFloat(x)*StaticHelper.widthRatio
  }
  func getY()->CGFloat{
    return CGFloat(y)*StaticHelper.widthRatio
  }
  
  static func create(type:Int,x:Int,y:Int,width:Int,height:Int,color:Int)->Piece{
    let piece = Piece()
    piece.height = height
    piece.width = width
    piece.x = x
    piece.y = y
    piece.type = type
    piece.color = color
    return piece
  }
}

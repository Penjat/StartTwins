

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
}

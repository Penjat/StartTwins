

import Foundation

extension Piece {
  func getX()->CGFloat{
    return CGFloat(x)*StaticHelper.widthRatio - StaticHelper.centerOffset + getWidth()/2
  }
  func getY()->CGFloat{
    return CGFloat(y)*StaticHelper.widthRatio
  }
  func getWidth()->CGFloat{
    return CGFloat(width)*StaticHelper.widthRatio
  }
  func getHeight()->CGFloat{
    return CGFloat(height)*StaticHelper.widthRatio
  }
}

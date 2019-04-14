

import Foundation


enum PieceColor{
  case Gray,Red,Blue,White
  
  static func getPieceColor(num:Int)-> PieceColor{
    
    switch num{
    case 0:
      return Gray
    case 1:
      return Red
    case 2:
      return Blue
    case 3:
      return White
    default:
      return Gray
    }
  }
}

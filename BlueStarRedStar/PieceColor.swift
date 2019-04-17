

import Foundation


enum PieceColor : Int{
  case Gray = 0,Red = 1,Blue = 2,White = 3
  
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

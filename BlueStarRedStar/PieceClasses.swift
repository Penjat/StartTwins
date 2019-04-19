

import Foundation

enum PieceClass : Int{
  case Coin = 2, Wall = 3, Hobbin = 4
  
  static func get(pieceClass:Int) -> PieceClass{
    switch pieceClass {
    case PieceClass.Coin.rawValue:
      return .Coin
    case PieceClass.Wall.rawValue:
      return .Wall
    case PieceClass.Hobbin.rawValue:
      return .Hobbin
    default :
      print("Error: unknown pieceClass.  Defaulting to wall")
      return .Wall
    }
  }
}

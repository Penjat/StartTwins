

import Foundation

enum PieceClass : Int{
  case Coin = 2, Wall = 3, Hobbin = 4, Nobbin = 5 , Diamond = 6,Chobbin = 7
  
  static func get(pieceClass:Int) -> PieceClass{
    
    //Get the piece for the Realm Int
    switch pieceClass {
      
    case PieceClass.Coin.rawValue:
      return .Coin
    case PieceClass.Wall.rawValue:
      return .Wall
    case PieceClass.Hobbin.rawValue:
      return .Hobbin
    case PieceClass.Nobbin.rawValue:
      return .Nobbin
    case PieceClass.Diamond.rawValue:
      return .Diamond
    case PieceClass.Chobbin.rawValue:
      return .Chobbin
      
      
    default :
      print("Error: unknown pieceClass.  Defaulting to wall")
      return .Wall
    }
  }
}

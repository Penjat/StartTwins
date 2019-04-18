

import SpriteKit

enum PieceType : Int{
  case Player = 1,Coin = 2,Wall = 3
 
  func toString()->String{
    
    switch self{
    case .Player:
      return "Player"
    case .Coin:
      return "Coin"
    case .Wall:
      return "Wall"
    }
  }
}



  
  
  


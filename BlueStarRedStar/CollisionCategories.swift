

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


enum PieceColor{
  case Gray,Red,Blue
  
  static func getPieceColor(num:Int)-> PieceColor{
    
    switch num{
    case 0:
      return Gray
    case 1:
      return Red
    case 2:
      return Blue
    default:
      return Gray
    }
    
  }
  
  func getColor()-> UIColor{
    
    switch self{
    case .Gray:
      return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    case .Red:
      return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    case .Blue:
      return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    
    }
    
  }
  
}

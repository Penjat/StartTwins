

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
  case Gray,Red,Blue,White
  
  static func getPieceColor(num:Int)-> PieceColor{
    
    switch num{
      
    //random between red and blue
    case -1:
      let rand = Int.random(in: 0...1)
      if rand == 0{
        return .Blue
      }
      return .Red
      
    case 0:
      return .Gray
    case 1:
      return .Red
    case 2:
      return .Blue
    case 3:
      return .White
    default:
      return .Gray
    }
    
  }
  
  func getColor()-> UIColor{
    
    switch self{
    case .Gray:
      return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    case .Red:
      return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    case .Blue:
      return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    case .White:
      return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    }
    
  }
  
}

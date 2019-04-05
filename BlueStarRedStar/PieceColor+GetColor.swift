

import UIKit

extension PieceColor{
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

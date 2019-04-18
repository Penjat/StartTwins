

import Cocoa

extension PieceColor{
  func getColor()->NSColor{
    
    switch self{
    case .Gray:
      return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    case .Red:
      return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    case .Blue:
      return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    case .White:
      return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    case .Purple:
      return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
  }
  static func getPieceColor(num:Int)-> PieceColor{
    
    switch num{
    case 0:
      return .Gray
    case 1:
      return .Red
    case 2:
      return .Blue
    case 3:
      return .White
    case 4:
      return .Purple
      
    default:
      return Gray
    }
  }
}

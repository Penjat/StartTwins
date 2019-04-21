

import Foundation

enum MoveDir {
  case Right,Left
  
  func reverseDir() -> MoveDir{
    
    switch self{
      
    case .Left:
      return .Right
    case .Right:
      return .Left
    }
  }
}

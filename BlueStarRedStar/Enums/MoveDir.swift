

import Foundation

enum MoveDir : Int {
  case Right = 1,Left = -1
  
  func reverseDir() -> MoveDir{
    
    switch self{
      
    case .Left:
      return .Right
    case .Right:
      return .Left
    }
  }
}

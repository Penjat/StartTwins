

import SpriteKit

class TailPiece: SKSpriteNode {
  
  func checkShouldRemove(_ playerDelegate:PlayerDelegate)->Bool{
 
    if position.y + playerDelegate.getMovingNode().position.y < -playerDelegate.getScreenEdge() {
      return true
    }
    return false
  }
  
  
  
}



import UIKit
import SpriteKit

class PlayerPiece : SKSpriteNode {
  var pieceColor : PieceColor!
  var lastTailPiece : TailPiece?
  let tailSpacing : CGFloat = 100.0
  var tailPieces = [TailPiece]()
  
  func checkTail(_ moveNodeYPos:CGFloat) -> Bool{
    //check if should create a tail
    
    if let lastTailPiece = lastTailPiece{
      
      let dx = position.x - lastTailPiece.position.x
      let dy = position.y - lastTailPiece.position.y - moveNodeYPos
      let dist = sqrt(dx * dx + dy * dy);
      if dist < tailSpacing{
        return false
      }
    }
    return true
  }
  
  func createTail(movingNode:SKNode){
    
    let tailPiece = TailPiece(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), size: CGSize(width: 10.0, height: 10.0))
    let x = self.position.x
    let y = self.position.y - movingNode.position.y
    tailPiece.position = CGPoint(x:x,y:y)
    lastTailPiece = tailPiece
    movingNode.addChild(tailPiece)
    tailPieces.append(tailPiece)
  }
  func checkRemoveTail(playerDelegate:PlayerDelegate){
    
    //check if there are any tail pieces, check if the oldest one needs to be removed
    if tailPieces.count > 0 , tailPieces[0].checkShouldRemove(playerDelegate) {
      
      tailPieces[0].removeFromParent()
      tailPieces.remove(at: 0)
      
    }
  }
}



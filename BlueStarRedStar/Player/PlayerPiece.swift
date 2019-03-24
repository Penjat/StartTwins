

import UIKit
import SpriteKit

class PlayerPiece: SKSpriteNode {
  var pieceColor : PieceColor!
  var lastTailPiece : SKSpriteNode?
  let tailSpacing = 100.0
  
  func checkTail() -> Bool{
    //check if should create a tail
    return false
  }
  
  func createTail(movingNode:SKNode){
    
    let tailPiece = TailPiece(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), size: CGSize(width: 10.0, height: 10.0))
    let x = self.position.x
    let y = self.position.y - movingNode.position.y
    tailPiece.position = CGPoint(x:x,y:y)
    movingNode.addChild(tailPiece)
    //TODO keep track of tailPieces
  }
}



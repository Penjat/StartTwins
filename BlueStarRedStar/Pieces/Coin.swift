

import Foundation
import SpriteKit

class Coin : PieceNode{
  
  var node: SKSpriteNode!
  
  
  func create(scene: GameScene, piece: Piece) {
    
    //TODO get size and color from piece
    node = SKSpriteNode(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), size: CGSize(width: 40.0, height: 40.0))
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
  }
  
  
}

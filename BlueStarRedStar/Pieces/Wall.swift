

import Foundation
import SpriteKit

class Wall: PieceNode {
  
  var node: SKSpriteNode!

  func create(scene: GameScene, piece: Piece) {
    
    //TODO get size and color from piece
    node = SKSpriteNode(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), size: CGSize(width: 40.0, height: 40.0))
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
  }
}

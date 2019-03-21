

import Foundation
import SpriteKit

class Wall: PieceNode {
  
  //var node: SKSpriteNode!

  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    
    let node = Wall(color: PieceColor.Gray.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
    
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:piece.getWidth(),height:piece.getHeight()))
    node.physicsBody?.collisionBitMask = 0
    node.physicsBody?.contactTestBitMask = 1
    node.physicsBody?.categoryBitMask = 1
    node.physicsBody?.isDynamic = true
    node.name = PieceType.Wall.toString()
    return node
  }
}

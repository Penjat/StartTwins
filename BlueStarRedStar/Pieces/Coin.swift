

import Foundation
import SpriteKit

class Coin : PieceNode{
  
  //var node: SKSpriteNode!
  var pieceColor : PieceColor!
  var points = 10
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    let node = Coin(color: pieceColor.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    node.pieceColor = pieceColor
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
    
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:piece.getWidth(),height:piece.getHeight()))
    node.physicsBody?.collisionBitMask = 0
    node.physicsBody?.contactTestBitMask = 1
    node.physicsBody?.categoryBitMask = 1
    node.physicsBody?.isDynamic = true
    node.name = PieceType.Coin.toString()
  
    return node
  }
  
  func pickedUp(){
    
    //print("adding points")
    let fadeOut = SKAction.fadeOut(withDuration: 0.4)
    let growOut = SKAction.scale(by: 1.4, duration: 0.4)
    let sequence = SKAction.sequence([SKAction.group([fadeOut,growOut]),SKAction.removeFromParent() ])
    run(sequence)
    //removeFromParent()
  }
  
  
}

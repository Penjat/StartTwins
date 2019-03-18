

import Foundation
import SpriteKit

class Coin : PieceNode{
  
  //var node: SKSpriteNode!
  var pieceColor : PieceColor!
  var points = 10
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    let node = Coin(color: pieceColor.getColor(), size: CGSize(width: 40.0, height: 40.0))
    node.pieceColor = pieceColor
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
    //TODO get size and color from piece
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:40.0,height:40.0))
    node.physicsBody?.collisionBitMask = 0
    node.physicsBody?.contactTestBitMask = 1
    node.physicsBody?.categoryBitMask = 1
    node.physicsBody?.isDynamic = true
    node.name = PieceType.Coin.toString()
    return node
  }
  
  func pickedUp(){
    
    print("adding points")
    removeFromParent()
  }
  
  
}

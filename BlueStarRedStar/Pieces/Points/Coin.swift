

import Foundation
import SpriteKit

class Coin : PieceNode{
  
  var pieceColor : PieceColor!
  var points = 10
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    //let node = Coin(color: pieceColor.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    let coinTexture = SKTexture(imageNamed: "coing")
    
    let node = Coin.init(texture: coinTexture, color: UIColor.white, size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    node.color = pieceColor.getColor()
    node.colorBlendFactor = 1.0
    node.pieceColor = pieceColor
    
    let rotate = SKAction.rotate(byAngle: 1.0, duration: 3.0)
    node.run(SKAction.repeatForever(rotate) )
    let growShrink = SKAction.sequence([SKAction.scale(to:1.2, duration: 1.0) ,SKAction.scale(to:1.0, duration: 1.0) ])
    node.run(SKAction.repeatForever(growShrink))
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
}

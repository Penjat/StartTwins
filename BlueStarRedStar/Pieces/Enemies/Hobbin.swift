
import SpriteKit

class Hobbin : PieceNode{
  
  //var node: SKSpriteNode!
  var pieceColor : PieceColor!
  var points = 20
  
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    //let node = Coin(color: pieceColor.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    
    //TODO import a texture
    let hobbinTexture = SKTexture(imageNamed: "Hobbin4")
    
    let node = Hobbin.init(texture: hobbinTexture, color: UIColor.white, size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    node.color = pieceColor.getColor()
    node.colorBlendFactor = 1.0
    node.pieceColor = pieceColor
    
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
    
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:piece.getWidth(),height:piece.getHeight()))
    node.physicsBody?.collisionBitMask = 0
    node.physicsBody?.contactTestBitMask = 1
    node.physicsBody?.categoryBitMask = 1
    node.physicsBody?.isDynamic = true
    node.name = PieceType.Enemy.toString()
    
    return node
  }
  
  
}

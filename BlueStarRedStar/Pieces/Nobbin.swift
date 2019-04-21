
import SpriteKit

class Nobbin : PieceNode{
  
  
  let moveSpeed = 3.0
  var pieceColor : PieceColor!
  var points = 20
  
  var moveDir = MoveDir.Left
  
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    //let node = Coin(color: pieceColor.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    
    //TODO import a texture
    //let hobbinTexture = SKTexture(imageNamed: nil)
    
    let node = Nobbin.init(texture: nil, color: UIColor.white, size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
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
    
    node.reverseMove()
    
    return node
  }
  func reverseMove(){
    removeAllActions()
    moveDir = moveDir.reverseDir()
    
    let edge = (StaticHelper.centerOffset - self.size.width / 2) * CGFloat(moveDir.rawValue)
    
    
    //TODO calculate the duration properly
    
    
    let moveAction = SKAction.sequence(
      [
        SKAction.moveTo(x: edge, duration: 2),
        SKAction.run {
          self.reverseMove()
        }
        ])
    run(moveAction)
    
  }
  
  
  
  
}


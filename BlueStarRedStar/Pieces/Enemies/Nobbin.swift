
import SpriteKit

class Nobbin : PieceNode{
  
  
  let moveSpeed : CGFloat = 300.0
  var pieceColor : PieceColor!
  var points = 20
  
  var moveDir = MoveDir.Left
  
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    //let node = Coin(color: pieceColor.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    
    let nobbinTexture = SKTexture(imageNamed: "Nobbin")
    
    let node = Nobbin.init(texture: nobbinTexture, color: UIColor.white, size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
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
    
    //make red and blue move opposite direction
    if node.pieceColor == .Blue{
      node.moveDir = .Right
    }
    node.reverseMove()
    
    return node
  }
  
  func reverseMove(){
    removeAllActions()
    moveDir = moveDir.reverseDir()
    
    let edge = (StaticHelper.centerOffset - self.size.width / 2) * CGFloat(moveDir.rawValue)
    print("move edge = \(edge)")
    //calculate the time so that the speed is the same
    let moveTime = Double(abs(edge - position.x)/moveSpeed)
    print("move time = \(moveTime)")
   
    let moveAction = SKAction.sequence(
      [
        SKAction.moveTo(x: edge, duration: moveTime),
        SKAction.run {
          self.reverseMove()
        }
        ])
    run(moveAction)
    
  }
  
  
  
  
}


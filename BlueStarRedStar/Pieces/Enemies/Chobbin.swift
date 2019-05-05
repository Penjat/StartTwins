import SpriteKit

class Chobbin : PieceNode{
  //var node: SKSpriteNode!
  var pieceColor : PieceColor!
  var points = 20
  static let changeRate :CGFloat = 4.2
  
  static func create(scene: GameScene, piece: Piece) -> PieceNode{
    
    let pieceColor = PieceColor.getPieceColor(num: piece.color)
    
    //let node = Coin(color: pieceColor.getColor(), size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    
    //TODO change for chobbin
    let hobbinTexture = SKTexture(imageNamed: "Hobbin")
    
    let node = Chobbin.init(texture: hobbinTexture, color: UIColor.white, size: CGSize(width: piece.getWidth(), height: piece.getHeight()))
    node.color = pieceColor.getColor()
    node.colorBlendFactor = 1.0
    node.pieceColor = pieceColor
    
    
    let yPos = piece.getY() + scene.frame.height/2 - scene.movingNode.position.y
    
    node.position = CGPoint(x: piece.getX(), y: yPos)
    scene.movingNode.addChild(node)
    
    //make it change to purple
    let changeColor = SKAction.colorize(with: UIColor.purple, colorBlendFactor: 1.0, duration: 1.0)
    
    let waitTime = Double((StaticHelper.heightCount + CGFloat(piece.y))/StaticHelper.moveSpeed * changeRate)
    let wait = SKAction.wait(forDuration: waitTime)
    
    node.run(SKAction.sequence([wait,changeColor]))
    
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:piece.getWidth(),height:piece.getHeight()))
    node.physicsBody?.collisionBitMask = 0
    node.physicsBody?.contactTestBitMask = 1
    node.physicsBody?.categoryBitMask = 1
    node.physicsBody?.isDynamic = true
    node.name = PieceType.Enemy.toString()
    
    return node
  }
}

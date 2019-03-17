
import SpriteKit
import GameplayKit


class GameScene: SKScene {
  
  let levelManager = LevelManager()
  let pieceFactory = PieceFactory()
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  var player :PlayerMaster!
  var staticNode = SKNode()
  var movingNode = SKNode()
  
  
  override func didMove(to view: SKView) {
    levelManager.setUp()
    levelManager.getLevel()
    
    self.addChild(staticNode)
    staticNode.addChild(movingNode)
    
    let movingNodeMove = SKAction.repeatForever(SKAction.moveBy(x: 0, y: -50.0, duration: 1))
    movingNode.run(movingNodeMove)
    
    player = PlayerMaster(scene: self)
    
    
    
    
    
  }
  
  
  
  override func update(_ currentTime: TimeInterval) {
    if pieceFactory.checkShouldCreateSegment(movingNode: movingNode){
      pieceFactory.createPiece(scene: self)
    }
  }
}

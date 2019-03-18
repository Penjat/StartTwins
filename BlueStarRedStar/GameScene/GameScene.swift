
import SpriteKit
import GameplayKit


class GameScene: SKScene {
  
  
  let pieceFactory = PieceFactory()
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  var player :PlayerMaster!
  var staticNode = SKNode()
  var movingNode = SKNode()
  
  
  override func didMove(to view: SKView) {
    StaticHelper.setRatio(scene: self)
    
    self.addChild(staticNode)
    staticNode.addChild(movingNode)
    
    let movingNodeMove = SKAction.repeatForever(SKAction.moveBy(x: 0, y: -50.0, duration: 1))
    movingNode.run(movingNodeMove)
    
    player = PlayerMaster(scene: self)
    pieceFactory.startGame(scene:self)
    
    
    
    
  }
  
  
  
  override func update(_ currentTime: TimeInterval) {
    
    pieceFactory.checkShouldChange(scene: self)
    
  }
}

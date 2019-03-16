
import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  var player :PlayerMaster!
  var staticNode = SKNode()
  var movingNode = SKNode()
  
  
  override func didMove(to view: SKView) {
    
    movingNode.addChild(staticNode)
    player = PlayerMaster(scene: self)
    
  }
  
  
  
  override func update(_ currentTime: TimeInterval) {
    
  }
}

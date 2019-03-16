
import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  var player :PlayerMaster!
  override func didMove(to view: SKView) {
    
    
    player = PlayerMaster(scene: self)
    
  }
  
  
  
  override func update(_ currentTime: TimeInterval) {
    
  }
}

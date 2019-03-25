
import SpriteKit
import GameplayKit


class GameScene: SKScene {
  
  
  let pieceFactory = PieceFactory()
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  var player :PlayerMaster!
  var staticNode = SKNode()
  var movingNode = SKNode()
  
  var isPlaying = false
  
  var curMenu : UIView?
  
  
  override func didMove(to view: SKView) {
    StaticHelper.setRatio(scene: self)
    physicsWorld.contactDelegate = self
    self.addChild(staticNode)
    staticNode.addChild(movingNode)

    player = PlayerMaster(scene: self)

    toTitle(withIntro: true)
    
  }

  override func update(_ currentTime: TimeInterval) {
    if isPlaying{
      pieceFactory.checkShouldChange(scene: self)
      pieceFactory.checkShouldClear(scene: self)
    }
    player.update(currentTime)
  }
}

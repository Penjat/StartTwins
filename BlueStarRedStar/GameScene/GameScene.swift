
import SpriteKit
import GameplayKit


class GameScene: SKScene {
  
  
  var pieceFactory : PieceFactory!
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  var player :PlayerMaster!
  var staticNode = SKNode()
  var movingNode = SKNode()
  
  var isPlaying = false
  
  var curMenu : UIView?
  
  
  override func didMove(to view: SKView) {
    
    pieceFactory = PieceFactory()
    HighScoreManager.createPlaceHolderScores()
    
    
    StaticHelper.setRatio(scene: self)
    physicsWorld.contactDelegate = self
    self.addChild(staticNode)
    staticNode.addChild(movingNode)

    player = PlayerMaster(scene: self)

    toTitle(withIntro: false)
    
    
    
    let path = Bundle.main.path(forResource: "Space", ofType: "sks")
    var spaceEffect = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
    
    spaceEffect.position = CGPoint(x:0,y:frame.height/2.0)
    spaceEffect.name = "spaceParticle"
    spaceEffect.targetNode = self.scene
    spaceEffect.particlePositionRange = CGVector(dx: frame.width, dy: 0)
    spaceEffect.advanceSimulationTime(60)
    addChild(spaceEffect)
    
    
    //set to be piece color
//    spaceEffect.particleColorSequence = nil;
//    spaceEffect.particleColorBlendFactor = 1.0;
//    spaceEffect.particleColor = pieceColor.getColor()
    
  }

  override func update(_ currentTime: TimeInterval) {
    if isPlaying{
      pieceFactory.checkShouldChange(scene: self)
      pieceFactory.checkShouldClear(scene: self)
      
      //TODO keep moving for intro
      player.update(currentTime)
    }
    
  }
}

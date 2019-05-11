
import SpriteKit

extension Hobbin : Enemy{
  func getPoints() -> Int {
    return points
  }
  
  func pickedUp(){
    
    //clear physics body to prevent extra collisions
    physicsBody = nil
    
    removeAllActions()
    //print("adding points")
    let fadeOut = SKAction.fadeOut(withDuration: 0.4)
    let growOut = SKAction.scale(by: 2.0, duration: 0.4)
    let sequence = SKAction.sequence([SKAction.group([fadeOut,growOut]),SKAction.removeFromParent() ])
    run(sequence)
    //removeFromParent()
    
    //Explode
    let path = Bundle.main.path(forResource: "EnemyExplode", ofType: "sks")
    var explosion = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
    
    explosion.position = position
    explosion.name = "rainParticle"
    explosion.targetNode = self.scene
    
    //set to be piece color
    explosion.particleColorSequence = nil;
    explosion.particleColorBlendFactor = 1.0;
    explosion.particleColor = pieceColor.getColor()
    let staticNode = self.parent
    staticNode?.addChild(explosion)
    
    StaticHelper.createPoints(node: self, points: points)
  }
  func explode(_ playerDelegate:PlayerDelegate){
    
  }
  
  func getColor() -> PieceColor{
    return pieceColor
  }
  
  func hit(object:SKNode?){
    //do nothing
  }
}

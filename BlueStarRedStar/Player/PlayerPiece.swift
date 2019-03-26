

import UIKit
import SpriteKit

class PlayerPiece : SKSpriteNode {
  var pieceColor : PieceColor!
  var lastTailPiece : TailPiece?
  let tailSpacing : CGFloat = 100.0
  var tailPieces = [TailPiece]()
  
  var tail : SKEmitterNode!
  var tailRate :CGFloat = 0.0
  
  func startParticleTail(_ playerDelegate:PlayerDelegate){
    
    let path = Bundle.main.path(forResource: "Tail", ofType: "sks")
    tail = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
    
    tail.position = CGPoint(x:size.width/2,y:size.height/2)
    tail.name = "tailParticle"
    tail.targetNode = playerDelegate.getMovingNode()
    
    tail.particleColorSequence = nil;
    tail.particleColorBlendFactor = 1.0;
    tail.particleColor = pieceColor.getColor()
    tailRate = tail.particleBirthRate
    addChild(tail)
  }
  func checkTail(_ moveNodeYPos:CGFloat) -> Bool{
    //check if should create a tail
    
    if let lastTailPiece = lastTailPiece{
      
      let dx = position.x - lastTailPiece.position.x
      let dy = position.y - lastTailPiece.position.y - moveNodeYPos
      let dist = sqrt(dx * dx + dy * dy);
      if dist < tailSpacing{
        return false
      }
    }
    return true
  }
  func tailActive(_ isActive:Bool){
    if isActive{
      tail.particleBirthRate = tailRate
      return
    }
    tail.particleBirthRate = 0.0
  }
  
  func createTail(movingNode:SKNode){
    
    let tailPiece = TailPiece(color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), size: CGSize(width: 10.0, height: 10.0))
    let x = self.position.x
    let y = self.position.y - movingNode.position.y
    tailPiece.position = CGPoint(x:x,y:y)
    lastTailPiece = tailPiece
    movingNode.addChild(tailPiece)
    tailPieces.append(tailPiece)
  }
  func checkRemoveTail(playerDelegate:PlayerDelegate){
    
    //check if there are any tail pieces, check if the oldest one needs to be removed
    if tailPieces.count > 0 , tailPieces[0].checkShouldRemove(playerDelegate) {
      
      tailPieces[0].removeFromParent()
      tailPieces.remove(at: 0)
      
    }
  }
  
  func explode(_ playerDelegate:PlayerDelegate){
    let staticNode = playerDelegate.getStaticNode()
    let path = Bundle.main.path(forResource: "PlayerExplode", ofType: "sks")
    var explosion = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
    
    explosion.position = position
    explosion.name = "rainParticle"
    explosion.targetNode = self.scene
    
    //set to be piece color
    explosion.particleColorSequence = nil;
    explosion.particleColorBlendFactor = 1.0;
    explosion.particleColor = pieceColor.getColor()
    
    staticNode.addChild(explosion)
  }
  func hitEffect(_ playerDelegate:PlayerDelegate){
    let staticNode = playerDelegate.getStaticNode()
    let path = Bundle.main.path(forResource: "PlayerHurt", ofType: "sks")
    var hit = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
    
    hit.position = position
    hit.name = "rainParticle"
    hit.targetNode = self.scene
    
    staticNode.addChild(hit)
  }
}



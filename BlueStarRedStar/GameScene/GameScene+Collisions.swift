

import SpriteKit

extension GameScene : SKPhysicsContactDelegate{
  func didBegin(_ contact: SKPhysicsContact) {
    print("contact happened ")
    
    //check collision involving player
    if contact.bodyA.node?.name == PieceType.Player.toString(){

      player.hitSomething(playerPiece: contact.bodyA, other: contact.bodyB)
      
    }else if contact.bodyB.node?.name == PieceType.Player.toString(){

      player.hitSomething(playerPiece: contact.bodyB, other: contact.bodyA)
    }else{
      print("player not involved \(contact.bodyA.categoryBitMask) , \(contact.bodyB.categoryBitMask)")
    }
  }
  
  
}


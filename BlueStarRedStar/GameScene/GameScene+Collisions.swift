

import SpriteKit

extension GameScene : SKPhysicsContactDelegate{
  func didBegin(_ contact: SKPhysicsContact) {
    
    //dont check if not playing
    if !isPlaying{
      return
    }
    
    
    
    //check collision involving player
    if contact.bodyA.node?.name == PieceType.Player.toString(){

      player.hitSomething(playerPiece: contact.bodyA, other: contact.bodyB)
      //check if caused gameover
      if player.checkGameOver(){
        gameOver()
      }
      
    }else if contact.bodyB.node?.name == PieceType.Player.toString(){

      player.hitSomething(playerPiece: contact.bodyB, other: contact.bodyA)
      //check if caused gameover
      if player.checkGameOver(){
        gameOver()
      }
      
    }else if contact.bodyB.node?.name == PieceType.Enemy.toString(){
     //contact not involving player
      if let enemy = contact.bodyB.node as? Enemy{
        enemy.hit(object: contact.bodyA.node)
        
      }
    }else if contact.bodyA.node?.name == PieceType.Enemy.toString(){
      //contact not involving player
      if let enemy = contact.bodyA.node as? Enemy{
        enemy.hit(object: contact.bodyB.node)
        
      }
    }
  }
  
  
}


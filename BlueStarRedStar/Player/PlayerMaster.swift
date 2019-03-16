

import SpriteKit

class PlayerMaster {
  
  var playerBlue : PlayerPiece!
  var playerRed : PlayerPiece!
  
  init(scene:GameScene){
    
    playerBlue = PlayerPiece.init(texture: nil, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), size: CGSize(width: 20.0, height: 20.0))

    playerBlue.position = CGPoint(x:40.0,y:0.0)

    playerBlue.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerBlue.physicsBody?.collisionBitMask = 2
    playerBlue.physicsBody?.contactTestBitMask = 1
    playerBlue.physicsBody?.categoryBitMask = 1
    playerBlue.physicsBody?.isDynamic = false
    
    playerRed = PlayerPiece.init(texture: nil, color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), size: CGSize(width: 20.0, height: 20.0))
    
    playerRed.position = CGPoint(x:-40.0,y:0.0)
    
    playerRed.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerRed.physicsBody?.collisionBitMask = 2
    playerRed.physicsBody?.contactTestBitMask = 1
    playerRed.physicsBody?.categoryBitMask = 1
    playerRed.physicsBody?.isDynamic = false
    
    scene.addChild(playerRed)
    scene.addChild(playerBlue)
  }
  
  func moveTo(pos:CGPoint){
    playerBlue.position = CGPoint(x:pos.x,y:0.0)
    playerRed.position = CGPoint(x:-pos.x,y:0.0)
  }
}

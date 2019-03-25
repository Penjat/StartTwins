

import SpriteKit

class PlayerMaster {
  
  var delegate : PlayerDelegate!
  
  var isFlashing = false
  
  var playerBlue : PlayerPiece!
  var playerRed : PlayerPiece!
  var scoreLabel : SKLabelNode!
  var lives = [SKLabelNode]()
  var score = 0
  var playerRedColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
  var playerBlueColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
  
  init(scene:GameScene){
    
    
    delegate = scene
    
    scoreLabel = SKLabelNode(text: "0")
    
    let x = -50.0 + scene.frame.width/2
    let y = 60.0 - scene.frame.height/2
    scoreLabel.position = CGPoint(x:x , y:y)
    scoreLabel.fontSize = 50.0
    scene.staticNode.addChild(scoreLabel)
    
    
    playerBlue = PlayerPiece.init(texture: nil, color: playerBlueColor, size: CGSize(width: 20.0, height: 20.0))

    playerBlue.position = CGPoint(x:40.0,y:0.0)

    playerBlue.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerBlue.physicsBody?.collisionBitMask = 2
    playerBlue.physicsBody?.contactTestBitMask = 1
    playerBlue.physicsBody?.categoryBitMask = 1
    playerBlue.physicsBody?.isDynamic = false
    playerBlue.name = PieceType.Player.toString()
    playerBlue.pieceColor = .Blue
    scene.addChild(playerBlue)
    
    
    playerRed = PlayerPiece.init(texture: nil, color: playerRedColor, size: CGSize(width: 20.0, height: 20.0))
    
    playerRed.position = CGPoint(x:-40.0,y:0.0)
    
    playerRed.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerRed.physicsBody?.collisionBitMask = 2
    playerRed.physicsBody?.contactTestBitMask = 1
    playerRed.physicsBody?.categoryBitMask = 1
    playerRed.physicsBody?.isDynamic = false
    playerRed.name = PieceType.Player.toString()
    playerRed.pieceColor = .Red
    
    scene.addChild(playerRed)
    
    //startGame(scene: scene)
  }
  func startGame(scene:GameScene){
    addLife(scene: scene)
    addLife(scene: scene)
    addLife(scene: scene)
    score = 0
    scoreLabel.text = "\(score)"
    
  }
  
  func moveTo(pos:CGPoint){
    playerBlue.position = CGPoint(x:pos.x,y:0.0)
    playerRed.position = CGPoint(x:-pos.x,y:0.0)
  }
  
  func hitSomething(playerPiece:SKPhysicsBody,other:SKPhysicsBody){
    print("player hit something")
    
    switch (playerPiece.node?.name ,other.node?.name){


    case (_,PieceType.Wall.toString()):
      //print("player hit a wall should take damage")
      takeDamage()
      break

    case (PieceType.Player.toString(), PieceType.Coin.toString() ):
      
      //if it is a player and a coin
      if let coin = other.node as? Coin , let playerPiece = playerPiece.node as? PlayerPiece{
        
        //if purple, get points no matter what
        if coin.pieceColor == PieceColor.White{
          coin.pickedUp()
          add(points: coin.points)
          
          //else, check if the correct player piece picked it up
        }else if coin.pieceColor == playerPiece.pieceColor{
          coin.pickedUp()
          add(points: coin.points)
          
          
        }else{
          
          //TODO decide if wrong color points cause dmg
          //takeDamage()
        }
      }
      
      break



    default:
      print("matches no category")
      break
    }
    
    
  }
  
  func add(points:Int){
    score += points
    scoreLabel.text = "\(score)"
  }
  func takeDamage(){
    
    //dont take dmg if still recovering
    if isFlashing{
      return
    }
    if lives.count > 0 {
      let life = lives.removeLast()
      life.removeFromParent()
    }
    delegate.shakeScreen()
    startFlashing()
    
  }
  func startFlashing(){
    isFlashing = true
    let flashActionRed1 = SKAction.run({self.playerRed.color = UIColor.white})
    let waitRed = SKAction.wait(forDuration: 0.1)
    let flashActionRed2 = SKAction.run({self.playerRed.color = self.playerRedColor})
    let flashLoopRed =  SKAction.repeat(SKAction.sequence([flashActionRed1,waitRed,flashActionRed2,waitRed]), count: 10)
    self.playerRed.run(flashLoopRed ,completion: {
      self.isFlashing = false
    })
    
    let flashActionBlue1 = SKAction.run({self.playerBlue.color = UIColor.white})
    let waitBlue = SKAction.wait(forDuration: 0.1)
    let flashActionBlue2 = SKAction.run({self.playerBlue.color = self.playerBlueColor})
    let flashLoopBlue =  SKAction.repeat(SKAction.sequence([flashActionBlue1,waitBlue,flashActionBlue2,waitBlue]), count: 10)
    self.playerBlue.run(flashLoopBlue ,completion: {
      
    })
    
    
  }
  func checkGameOver()->Bool{
    return lives.count == 0 
      
  
  }
  
  func addLife(scene:GameScene){
    let life = SKLabelNode(text: "♥︎")
    let offset = CGFloat(40 * lives.count)
    let x = (50.0 - scene.frame.width/2) + offset
    let y = 40.0 - scene.frame.height/2
    life.position = CGPoint(x:x , y:y)
    lives.append(life)
    scene.staticNode.addChild(life)
  }
  
  func update(_ currentTime: TimeInterval){
    let movingNodePos = delegate.getMovingNode().position.y
    
    //check if it is time to create a new tail piece
    //TODO posibly only need to check one
    if playerRed.checkTail(movingNodePos){
      playerRed.createTail(movingNode: delegate.getMovingNode())
    }
    if playerBlue.checkTail(movingNodePos){
      playerBlue.createTail(movingNode: delegate.getMovingNode())
    }
    
    //check if it is time to delete an old tail piece
    //TODO posibly only check this when creating a new one
    playerRed.checkRemoveTail(playerDelegate: delegate)
    playerBlue.checkRemoveTail(playerDelegate: delegate)
    
  }
  func hide(_ isHidden:Bool){
    playerRed.isHidden = isHidden
    playerBlue.isHidden = isHidden
  }
}



import SpriteKit

class PlayerMaster {
  
  var delegate : PlayerDelegate!
  
  var lastHit = Date()//the time the player was last hit
  
  var isFlashing = false
  let verticalPos : CGFloat
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
    verticalPos = -scene.frame.height / 10
    
    scoreLabel.fontName = "Atari Font Full Version"
    scoreLabel.isHidden = true
    
    let x = -50.0 + scene.frame.width/2
    let y = -60.0 + scene.frame.height/2
    scoreLabel.position = CGPoint(x:x , y:y)
    scoreLabel.fontSize = 40.0
    scoreLabel.horizontalAlignmentMode = .right
    scene.staticNode.addChild(scoreLabel)
    let redPlayerTexture = SKTexture(imageNamed: "starEmpty")
    let bluePlayerTexture = SKTexture(imageNamed: "starEmpty")
    
    playerBlue = PlayerPiece.init(texture: bluePlayerTexture, color: playerBlueColor, size: CGSize(width: 60.0, height: 60.0))

    playerBlue.position = CGPoint(x:40.0,y:verticalPos)
    playerBlue.colorBlendFactor = 1.0
    playerBlue.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerBlue.physicsBody?.collisionBitMask = 2
    playerBlue.physicsBody?.contactTestBitMask = 1
    playerBlue.physicsBody?.categoryBitMask = 1
    playerBlue.physicsBody?.isDynamic = false
    playerBlue.name = PieceType.Player.toString()
    playerBlue.pieceColor = .Blue
    
    playerBlue.startParticleTail(delegate)
    scene.addChild(playerBlue)
    
    
    playerRed = PlayerPiece.init(texture: redPlayerTexture, color: playerRedColor, size: CGSize(width: 60.0, height: 60.0))
    
    playerRed.position = CGPoint(x:-40.0,y:verticalPos)
    playerRed.colorBlendFactor = 1.0
    playerRed.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerRed.physicsBody?.collisionBitMask = 2
    playerRed.physicsBody?.contactTestBitMask = 1
    playerRed.physicsBody?.categoryBitMask = 1
    playerRed.physicsBody?.isDynamic = false
    playerRed.name = PieceType.Player.toString()
    playerRed.pieceColor = .Red
    
    playerRed.startParticleTail(delegate)
    
    scene.addChild(playerRed)
    
    //startGame(scene: scene)
  }
  func startGame(scene:GameScene){
    addLife(scene: scene)
    addLife(scene: scene)
    addLife(scene: scene)
    score = 0
    scoreLabel.text = "\(score)"
    playerBlue.tailActive(true)
    playerRed.tailActive(true)
    scoreLabel.isHidden = false
  }
  
  func moveTo(pos:CGPoint){
    playerBlue.position = CGPoint(x:pos.x,y:verticalPos)
    playerRed.position = CGPoint(x:-pos.x,y:verticalPos)
  }
  
  func hitSomething(playerPiece:SKPhysicsBody,other:SKPhysicsBody){
    print("player hit something")
    
    switch (playerPiece.node?.name ,other.node?.name){


    case (_,PieceType.Wall.toString()):
      //print("player hit a wall should take damage")
      
      if !isFlashing, let playerPiece = playerPiece.node as? PlayerPiece{
        playerPiece.hitEffect(delegate)
      }else if Date().timeIntervalSince(lastHit) < 0.005 , let playerPiece = playerPiece.node as? PlayerPiece {
        //check if both player pieces hit something at the same time
        
        playerPiece.hitEffect(delegate)
      }
   
      takeDamage()
      break

    case (PieceType.Player.toString(), PieceType.Coin.toString() ):
      
      //if it is a player and a coin
      if let coin = other.node as? Points , let playerPiece = playerPiece.node as? PlayerPiece{
        
        //if purple, get points no matter what
        if coin.getColor() == PieceColor.White{
          coin.pickedUp()
          add(points: coin.getPoints())
          
          //else, check if the correct player piece picked it up
        }else if coin.getColor() == playerPiece.pieceColor{
          coin.pickedUp()
          add(points: coin.getPoints())
          
          
        }else{
          
          //TODO decide if wrong color points cause dmg
          //takeDamage()
        }
      }
      
      break
      
    case (PieceType.Player.toString(), PieceType.Enemy.toString() ):
      
      //if it is a player and an enemy
      if let enemy = other.node as? Enemy , let playerPiece = playerPiece.node as? PlayerPiece{
        
        if enemy.getColor() == playerPiece.pieceColor{
          enemy.pickedUp()
          add(points: enemy.getPoints())
          
        }else{
          //take dmg if colors don't match
          //or for white pieces
          takeDamage()
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
    
    let grow = SKAction.scale(to: 1.1, duration: 0.05)
    let shrink = SKAction.scale(to: 1.0, duration: 0.05)
    scoreLabel.run(SKAction.sequence([grow,shrink]))
    
  }
  func takeDamage(){
    
    //dont take dmg if still recovering
    if isFlashing{
      return
    }
    lastHit = Date()
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
    let y = -40.0 + scene.frame.height/2
    life.position = CGPoint(x:x , y:y)
    lives.append(life)
    scene.staticNode.addChild(life)
  }
  
  func update(_ currentTime: TimeInterval){
//    let movingNodePos = delegate.getMovingNode().position.y
    
    //check if it is time to create a new tail piece
    //TODO posibly only need to check one
//    if playerRed.checkTail(movingNodePos){
//      playerRed.createTail(movingNode: delegate.getMovingNode())
//    }
//    if playerBlue.checkTail(movingNodePos){
//      playerBlue.createTail(movingNode: delegate.getMovingNode())
//    }
    
    //check if it is time to delete an old tail piece
    //TODO posibly only check this when creating a new one
//    playerRed.checkRemoveTail(playerDelegate: delegate)
//    playerBlue.checkRemoveTail(playerDelegate: delegate)
    
  }
  func hide(_ isHidden:Bool){
    playerRed.isHidden = isHidden
    playerBlue.isHidden = isHidden
    
  }
  func hideScore(){
    scoreLabel.isHidden = true
  }
  
  func explode(){
    //TODO deleay one of the explosions
    playerRed.explode(delegate)
    playerBlue.explode(delegate)
    playerBlue.tailActive(false)
    playerRed.tailActive(false)
  }
}

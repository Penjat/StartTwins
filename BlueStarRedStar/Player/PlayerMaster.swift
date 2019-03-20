

import SpriteKit

class PlayerMaster {
  
  var playerBlue : PlayerPiece!
  var playerRed : PlayerPiece!
  var scoreLabel : SKLabelNode!
  var lives = [SKLabelNode]()
  var score = 0
  
  init(scene:GameScene){
    
    
    
    
    scoreLabel = SKLabelNode(text: "0")
    
    let x = -50.0 + scene.frame.width/2
    let y = 60.0 - scene.frame.height/2
    scoreLabel.position = CGPoint(x:x , y:y)
    scoreLabel.fontSize = 50.0
    scene.staticNode.addChild(scoreLabel)
    
    
    playerBlue = PlayerPiece.init(texture: nil, color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), size: CGSize(width: 20.0, height: 20.0))

    playerBlue.position = CGPoint(x:40.0,y:0.0)

    playerBlue.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:20,height:20))
    playerBlue.physicsBody?.collisionBitMask = 2
    playerBlue.physicsBody?.contactTestBitMask = 1
    playerBlue.physicsBody?.categoryBitMask = 1
    playerBlue.physicsBody?.isDynamic = false
    playerBlue.name = PieceType.Player.toString()
    playerBlue.pieceColor = .Blue
    scene.addChild(playerBlue)
    
    
    playerRed = PlayerPiece.init(texture: nil, color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), size: CGSize(width: 20.0, height: 20.0))
    
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
      print("player hit a wall should take damage")
      takeDamage()
      break

    case (PieceType.Player.toString(), PieceType.Coin.toString() ):

      print("check the points")
      if let coin = other.node as? Coin , let playerPiece = playerPiece.node as? PlayerPiece{
        if coin.pieceColor == playerPiece.pieceColor{
          coin.pickedUp()
          add(points: coin.points)
          print("should get points")
        }else{
          print("no points")
          
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
    if lives.count > 0 {
      let life = lives.removeLast()
      life.removeFromParent()
    }
    
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
  
}



import SpriteKit

extension GameScene{
  
  func startGame() {
    print("starting game")
    //make sure the player is showing
    //TODO animate in somehow
    player.hide(false)
    
    
    
    //remove any menus
    if let curMenu = curMenu{
      //curMenu.removeFromSuperview()
      curMenu.clear(menuCommand: .StartGame)
    }
    
    //start creating pieces
    pieceFactory.startGame(scene:self)
    
    //move the moving node
    
    
    
    
    
    player.startGame(scene: self)
    isPlaying = true
  }
  func setMoving(speed:CGFloat){
    movingNode.removeAllActions()
    let movingNodeMove = SKAction.repeatForever(SKAction.moveBy(x: 0, y: -speed, duration: 1))
    movingNode.run(movingNodeMove)
  }
  
  func gameOver(){
    print("gameover")
    
    //hide the player
    player.explode()
    player.hide(true)
    
    
    movingNode.removeAllActions()
    //TODO calculate actual time
    let moveOffScreen = SKAction.moveBy(x: 0, y: -frame.height*2, duration: 10.0)
    movingNode.run(moveOffScreen)
    isPlaying = false
    
    
    if let curMenu = curMenu{
      //curMenu.removeFromSuperview()
      curMenu.clear(menuCommand: .None)
    }
    let playerScorePlace = HighScoreManager.checkHigh(score: player.score)
    if  playerScorePlace < HighScoreManager.numberOfHighScores{
      player.hideScore()
      print("new high score")
      print("player place is \(playerScorePlace+1)")
      let newHighScoreView = NewHighScoreView(frame: (view?.frame)!)
      view?.addSubview(newHighScoreView)
      newHighScoreView.delegate = self
      newHighScoreView.set(score: player!.score)
      newHighScoreView.set(place: playerScorePlace+1)
      curMenu = newHighScoreView
      
      
    }else{
      print("you didn't get a high score")
      let gameOverView = MenuGameOverView(frame: (view?.frame)!)
      view?.addSubview(gameOverView)
      gameOverView.delegate = self
      
      
      curMenu = gameOverView
      
    }
    if let curMenu = curMenu as? UIView, let view = view{
      let x = view.frame.minX
      let y = -view.frame.height/2
      let width = view.frame.width
      let height = view.frame.height
      curMenu.frame = CGRect(x: x, y: y, width: width, height: height)
      
      UIView.animate(withDuration: 5) {
        curMenu.frame = self.view!.frame
      }
    }

  }
}

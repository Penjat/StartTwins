

import SpriteKit

extension GameScene{
  
  func startGame() {
    
    //remove any menus
    if let curMenu = curMenu{
      curMenu.removeFromSuperview()
    }
    
    //start creating pieces
    pieceFactory.startGame(scene:self)
    
    //move the moving node
    let movingNodeMove = SKAction.repeatForever(SKAction.moveBy(x: 0, y: -250.0, duration: 1))
    movingNode.run(movingNodeMove)
    player.startGame(scene: self)
    isPlaying = true
  }
  
  
  func gameOver(){
    //TODO show menu
    movingNode.removeAllActions()
    //TODO calculate actual time
    let moveOffScreen = SKAction.moveBy(x: 0, y: -frame.height, duration: 3.0)
    movingNode.run(moveOffScreen)
    isPlaying = false
    return
    
    if let curMenu = curMenu{
      curMenu.removeFromSuperview()
    }
    
    if HighScoreManager.checkHigh(score: player.score){
      
      print("new high score")
      let newHighScoreView = NewHighScoreView(frame: (view?.frame)!)
      view?.addSubview(newHighScoreView)
      newHighScoreView.delegate = self
      
      
      curMenu = newHighScoreView
      
    }else{
      print("you didn't get a high score")
      let gameOverView = MenuGameOverView(frame: (view?.frame)!)
      view?.addSubview(gameOverView)
      gameOverView.delegate = self
      
      
      curMenu = gameOverView
      
    }

  }
}



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
    
    //hide the player
    player.hide(true)
    
    
    movingNode.removeAllActions()
    //TODO calculate actual time
    let moveOffScreen = SKAction.moveBy(x: 0, y: -frame.height*2, duration: 10.0)
    movingNode.run(moveOffScreen)
    isPlaying = false
    
    
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
    if let curMenu = curMenu, let view = view{
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



import SpriteKit

extension GameScene{
  
  func gameOver(){
    //TODO show menu
    movingNode.removeAllActions()
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
    
    
    
    
    
  }
}

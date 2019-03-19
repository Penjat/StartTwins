

import SpriteKit

extension GameScene{
  
  func gameOver(){
    //TODO show menu
    movingNode.removeAllActions()
    isPlaying = false
    let gameOverView = MenuGameOverView(frame: (view?.frame)!)
    view?.addSubview(gameOverView)
    gameOverView.delegate = self
    
    if let curMenu = curMenu{
      curMenu.removeFromSuperview()
    }
    curMenu = gameOverView
  }
}

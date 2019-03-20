

import SpriteKit

extension GameScene : MenuDelegate{

  
  func toHighScores() {
    
  }
  func toTitle(){
    //TODO could add bool if it is first time
    let titleView = MenuTitleView(frame: view!.frame)
    view!.addSubview(titleView)
    titleView.delegate = self
    curMenu = titleView
  }
  
  func toStartGame() {
    //startGame and toStartGame are separet in case we decide to add any animations when starting from the title screen
    startGame()
  }
  
  func enterHighScore(name: String) {
    //TODO save score and go to game over menu
    HighScoreManager.saveHigh(score: player.score, playerName: name)
    restart()
  }
  
  func restart() {
    print("should restart the game")
    movingNode.position = CGPoint(x:0,y:0)
    let movingNodeMove = SKAction.repeatForever(SKAction.moveBy(x: 0, y: -150.0, duration: 1))
    movingNode.run(movingNodeMove)
    isPlaying = true
    pieceFactory.startGame(scene: self)
    player.startGame(scene: self)
    
    //TODO function to animate out
    curMenu?.removeFromSuperview()
    
  }
}

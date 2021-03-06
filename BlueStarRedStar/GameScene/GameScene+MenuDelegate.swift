

import SpriteKit

extension GameScene : MenuDelegate{

  
  func toHighScores() {
    player.hideScore()
    if let curMenu = curMenu{
      //curMenu.removeFromSuperview()
      curMenu.clear(menuCommand: .None)
    }
    
    let highScoreView = MenuHighScoresView(frame: view!.frame)
    let scores = HighScoreManager.getHighScores()
    highScoreView.setUp(scores: scores)
    
    view!.addSubview(highScoreView)
    highScoreView.delegate = self
    curMenu = highScoreView
  }
  
  func toTitle(withIntro:Bool){
    if let curMenu = curMenu{
      //curMenu.removeFromSuperview()
      curMenu.clear(menuCommand: .None)
    }
    //TODO could add bool if it is first time
    player.hideScore()
    let titleView = MenuTitleView(frame: view!.frame)
    view!.addSubview(titleView)
    titleView.delegate = self
    curMenu = titleView
    if withIntro{
      titleView.startFadeIn()
    }
  }
  
  func toStartGame() {
    //startGame and toStartGame are separet in case we decide to add any animations when starting from the title screen
    startGame()
  }
  
  func enterHighScore(name: String) {
    
    
    HighScoreManager.saveHigh(score: player.score, playerName: name)
    toTitle(withIntro: false)
  }
  
  func restart() {
    print("should restart the game")
    movingNode.position = CGPoint(x:0,y:0)
    startGame()
  }
}

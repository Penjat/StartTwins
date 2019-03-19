

import SpriteKit

extension GameScene : MenuDelegate{
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

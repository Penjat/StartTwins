import SpriteKit

extension Coin : Points{
  
  func getPoints() -> Int { return points }
  func getColor() -> PieceColor { return pieceColor}
  
  func pickedUp(){
    
    //clear physics body to prevent extra collisions
    physicsBody = nil
    
    removeAllActions()
    //print("adding points")
    let fadeOut = SKAction.fadeOut(withDuration: 0.4)
    let growOut = SKAction.scale(by: 2.0, duration: 0.4)
    let sequence = SKAction.sequence([SKAction.group([fadeOut,growOut]),SKAction.removeFromParent() ])
    run(sequence)
    //removeFromParent()
    
    let pointLabel = SKLabelNode(text: "10")
    pointLabel.fontName = "Atari Font Full Version"
    pointLabel.fontSize = 40.0
    let x = self.position.x
    let y = self.position.y
    pointLabel.position = CGPoint(x:x , y:y)
    
    self.parent?.addChild(pointLabel)
  }
  
}

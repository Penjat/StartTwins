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
    pointLabel.fontSize = 20.0
    let x = self.position.x
    let y = self.position.y
    pointLabel.position = CGPoint(x:x , y:y)
    
    self.parent?.addChild(pointLabel)
    
    let fadeOutPoints = SKAction.fadeOut(withDuration: 1.0)
    let growPoints = SKAction.scale(by: 3.0, duration: 1.0)
    pointLabel.run(SKAction.group([fadeOutPoints,growPoints]))
    
    
  }
  
}

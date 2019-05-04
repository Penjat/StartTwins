import SpriteKit

extension Diamond : Points{
  
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
  }
}

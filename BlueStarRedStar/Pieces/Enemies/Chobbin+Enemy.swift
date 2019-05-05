import SpriteKit

extension Chobbin : Enemy{
  func getPoints() -> Int {
    return points
  }
  
  func pickedUp(){
    print("Chobbin was hit")
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
  func getColor() -> PieceColor{
    return pieceColor
  }
  func hit(object:SKNode?){
    
//    if let enemy = object as? Enemy{
//      enemy.hit(object: nil)
//    }
  }
}

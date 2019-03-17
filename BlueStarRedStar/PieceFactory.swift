
import Foundation
import SpriteKit


class PieceFactory{
  var distNextSegment : CGFloat = 0.0
  
  func checkShouldCreateSegment(movingNode:SKNode) -> Bool{
    print("moving node = \(movingNode.position.y) , dist = \(distNextSegment)")
     return distNextSegment > movingNode.position.y
  
  }
  func createPiece(scene:GameScene){
    
    let piece = SKSpriteNode.init(texture: nil, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), size: CGSize(width: 40, height: 40))
    let yPos = scene.frame.height/2 - scene.movingNode.position.y
    piece.position = CGPoint(x: 0.0, y: yPos)
    scene.movingNode.addChild(piece)
    
    //TODO calculate properly with segment
    distNextSegment = scene.movingNode.position.y - 200
  }
}

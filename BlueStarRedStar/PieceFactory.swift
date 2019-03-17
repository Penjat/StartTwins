
import Foundation
import SpriteKit


class PieceFactory{
  
  
  func createPiece(scene:GameScene){
    
    let piece = SKSpriteNode.init(texture: nil, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), size: CGSize(width: 40, height: 40))
    piece.position = CGPoint(x: 0.0, y: 50.0)
    scene.movingNode.addChild(piece)
    
    
  }
}

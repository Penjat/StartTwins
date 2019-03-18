
import Foundation
import SpriteKit

protocol PieceNode {
  var node:SKSpriteNode! {get set}
  
  func create(scene:GameScene, piece:Piece)
}



import SpriteKit

protocol Enemy{
  
  func pickedUp()
  func getPoints() -> Int
  func getColor() -> PieceColor
  func hit(object:SKNode?)

}

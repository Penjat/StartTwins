

import Foundation

protocol Enemy{
  
  func pickedUp()
  func getPoints() -> Int
  func getColor() -> PieceColor
  
}

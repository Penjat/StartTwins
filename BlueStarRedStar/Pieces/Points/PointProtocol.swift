import Foundation

protocol Points {
  func pickedUp()
  func getPoints() -> Int
  func getColor() -> PieceColor
}

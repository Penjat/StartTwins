

import Foundation

extension ViewController : TileManagerDelegate{
  func create(rect: NSRect) {
    let pieceView = PieceView.init(frame: rect)
    containerView.addSubview(pieceView)
  }
}

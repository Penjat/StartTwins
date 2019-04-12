

import Foundation

extension EditSegmentViewController : TileManagerDelegate{
  func create(rect: NSRect) {
    let pieceView = PieceView.init(frame: rect)
    containerView.addSubview(pieceView)
  }
}

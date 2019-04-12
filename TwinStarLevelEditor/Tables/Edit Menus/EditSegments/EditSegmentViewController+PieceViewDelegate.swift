

import Foundation

extension EditSegmentViewController : PieceViewDelegate{
  func clicked(pieceView: PieceView) {
    
    if let pieceIndex = pieces.firstIndex(of: pieceView.piece){
      pieces.remove(at: pieceIndex)
    }
    pieceView.removeFromSuperview()
  }
  
  
}

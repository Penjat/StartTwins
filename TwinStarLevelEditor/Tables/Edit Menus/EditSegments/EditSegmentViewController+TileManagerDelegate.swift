

import Foundation

extension EditSegmentViewController : TileManagerDelegate{
  
  func create(x: Int, y: Int) {
    
    //TODO have all this info
    //TODO cur selected piece type
    let piece = Piece.create(type: 1, x: x, y: y, width: 2, height: 2, color: 2)
    pieces.append(piece)
    
    let tile = tiles[y][x]
    let rect = NSRect(x: tile.frame.minX, y: tile.frame.minY, width: 30, height: 30)
    
    let pieceView = PieceView.init(frame: rect)
    pieceView.piece = piece
    pieceView.delegate = self
    containerView.addSubview(pieceView)
  }
  
}

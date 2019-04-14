

import Foundation

extension EditSegmentViewController : TileManagerDelegate{
  
  func create(x: Int, y: Int) {
    
    guard y < tiles.count , x < tiles[0].count else{
      return
    }
    
    //TODO make a separet func for creating and loading
    
    guard let curTool = curTool else{
      return
    }
    //TODO have all this info
    //TODO cur selected piece type
    let piece = Piece.create(type: curTool.type, x: x, y: y, width: curTool.width, height: curTool.height, color: curTool.color)
    pieces.append(piece)
    
    let tile = tiles[y][x]
    let rect = NSRect(x: tile.frame.minX, y: tile.frame.minY, width: CGFloat(16*curTool.width), height: CGFloat(curTool.height*16))
    
    let pieceView = PieceView.init(frame: rect)
    pieceView.piece = piece
    pieceView.delegate = self
    containerView.addSubview(pieceView)
  }
  
  func create(piece loadedPiece:Piece){
    
    let x = loadedPiece.x
    let y = loadedPiece.y
    let width = loadedPiece.width
    let height = loadedPiece.height
    let color = loadedPiece.color
    let type = loadedPiece.type
    
    //TODO get proper values
    let piece = Piece.create(type: type, x: x, y: y, width: width, height: height, color: color)
    pieces.append(piece)
    
    let tile = tiles[y][x]
    let rect = NSRect(x: tile.frame.minX, y: tile.frame.minY, width: CGFloat(loadedPiece.width*16), height: CGFloat(loadedPiece.height*16))
    
    let pieceView = PieceView.init(frame: rect)
    pieceView.piece = piece
    pieceView.delegate = self
    containerView.addSubview(pieceView)
  }
  
}

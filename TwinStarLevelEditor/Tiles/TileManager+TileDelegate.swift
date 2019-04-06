

import Foundation

extension TileManager : TileDelegate{
  func clicked(tile: TileView) {
    print("A tile was clicked")
    
    delegate?.create(rect: NSRect(x: tile.frame.minX, y: tile.frame.minY, width: 30, height: 30))
  }
}

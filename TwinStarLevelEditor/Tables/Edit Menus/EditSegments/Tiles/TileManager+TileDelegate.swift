

import Foundation

extension TileManager : TileDelegate{
  func clicked(tile: TileView) {
    print("A tile was clicked")
    
    delegate?.create(x:tile.position.0, y:tile.position.1)
  }
}



import Foundation

extension TileManager : TileDelegate{
  func clicked(tile: TileView) {
    print("A tile was clicked")
  }
}

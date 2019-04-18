

import Foundation

class ToolManager{
  
  static let shared = ToolManager()
  
  let tools : [Tool]
  
  init() {
    tools = [
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.Blue.rawValue, type: PieceType.Coin.rawValue),
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.Red.rawValue, type: PieceType.Coin.rawValue),
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.White.rawValue, type: PieceType.Coin.rawValue),
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.Purple.rawValue, type: PieceType.Coin.rawValue),
      Tool(name: "wall 5x2",width: 5, height: 2, color: PieceColor.Gray.rawValue, type: PieceType.Wall.rawValue),
      Tool(name: "wall 2x10",width: 2, height: 10, color: PieceColor.Gray.rawValue, type: PieceType.Wall.rawValue)
      ]
    
  }
  
}


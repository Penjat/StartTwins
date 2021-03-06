

import Foundation

class ToolManager{
  
  static let shared = ToolManager()
  
  let tools : [Tool]
  
  init() {
    tools = [
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.Blue.rawValue, type: PieceClass.Coin.rawValue),
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.Red.rawValue, type: PieceClass.Coin.rawValue),
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.White.rawValue, type: PieceClass.Coin.rawValue),
      Tool(name: "coin",width: 2, height: 2, color: PieceColor.Purple.rawValue, type: PieceClass.Coin.rawValue),
      Tool(name: "wall 5x2",width: 5, height: 2, color: PieceColor.Gray.rawValue, type: PieceClass.Wall.rawValue),
      Tool(name: "wall 2x10",width: 2, height: 10, color: PieceColor.Gray.rawValue, type: PieceClass.Wall.rawValue),
      Tool(name: "Hobbin",width: 3, height: 3, color: PieceColor.Blue.rawValue, type: PieceClass.Hobbin.rawValue),
      Tool(name: "Hobbin",width: 3, height: 3, color: PieceColor.Red.rawValue, type: PieceClass.Hobbin.rawValue),
      Tool(name: "Hobbin",width: 3, height: 3, color: PieceColor.White.rawValue, type: PieceClass.Hobbin.rawValue),
      Tool(name: "Hobbin",width: 3, height: 3, color: PieceColor.Purple.rawValue, type: PieceClass.Hobbin.rawValue),
      Tool(name: "Nobbin",width: 4, height: 3, color: PieceColor.Blue.rawValue, type: PieceClass.Nobbin.rawValue),
      Tool(name: "Nobbin",width: 4, height: 3, color: PieceColor.Red.rawValue, type: PieceClass.Nobbin.rawValue),
      Tool(name: "Nobbin",width: 4, height: 3, color: PieceColor.White.rawValue, type: PieceClass.Nobbin.rawValue),
      Tool(name: "Nobbin",width: 4, height: 3, color: PieceColor.Purple.rawValue, type: PieceClass.Nobbin.rawValue),
      Tool(name: "Diamond",width: 2, height: 3, color: PieceColor.Red.rawValue, type: PieceClass.Diamond.rawValue),
      Tool(name: "Diamond",width: 2, height: 3, color: PieceColor.Blue.rawValue, type: PieceClass.Diamond.rawValue),
      Tool(name: "Chobbin",width: 3, height: 4, color: PieceColor.Red.rawValue, type: PieceClass.Chobbin.rawValue),
      Tool(name: "Chobbin",width: 3, height: 4, color: PieceColor.Blue.rawValue, type: PieceClass.Chobbin.rawValue),
      Tool(name: "Chobbin",width: 3, height: 4, color: PieceColor.White.rawValue, type: PieceClass.Chobbin.rawValue),
      Tool(name: "Chobbin",width: 3, height: 4, color: PieceColor.Purple.rawValue, type: PieceClass.Chobbin.rawValue)
      
      ]
    
  }
  
}


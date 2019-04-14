

import Foundation

class ToolManager{
  
  static let shared = ToolManager()
  
  let tools : [Tool]
  
  init() {
    tools = [
      Tool(name: "coin",width: 2, height: 2, color: 0, type: 1),
      Tool(name: "wall",width: 5, height: 1, color: 0, type: 2)
      ]
    
  }
  
}


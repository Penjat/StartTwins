

import Foundation

class ToolManager{
  
  static let shared = ToolManager()
  
  let tools : [Tool]
  
  init() {
    tools = [
      Tool(name: "coin"),
      Tool(name: "wall")
      ]
    
  }
  
}


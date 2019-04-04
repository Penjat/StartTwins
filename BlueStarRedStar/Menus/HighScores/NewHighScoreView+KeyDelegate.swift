

import Foundation

extension NewHighScoreView : KeyDelegate{
  func press(value: String) {
    if value == "⬅︎" {
      if let text = playerNameLabel.text{
        playerNameLabel.text = String(text.dropLast())
      }
      return
    }
    playerNameLabel.text = "\(playerNameLabel.text ?? "")\(value)"
    animate(letter: value)
  }
  
  
}

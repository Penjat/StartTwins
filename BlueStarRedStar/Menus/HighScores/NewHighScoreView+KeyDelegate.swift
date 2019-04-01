

import Foundation

extension NewHighScoreView : KeyDelegate{
  func press(value: String) {
    playerNameLabel.text = "\(playerNameLabel.text ?? "")\(value)"
  }
  
  
}



import UIKit

extension NewHighScoreView{
  
  func animate(letter:String){
    letterLabel.text = letter
    letterLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    letterLabel.alpha = 1.0
    UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
      self.letterLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
      self.letterLabel.alpha = 0.0
    }, completion: {_ in })
  }
}


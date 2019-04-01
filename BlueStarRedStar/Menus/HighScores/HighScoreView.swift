

import UIKit

class HighScoreView: UIView {
  
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  
  var delegate : MenuDelegate?
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("HighScore", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }
  func setUp(highScore:HighScore){
    scoreLabel.text = "\(highScore.score)"
    nameLabel.text = "\(highScore.playerName)"
  }
  func sway(index:Double){
    print("time to sway")
    
    UIView.animate(withDuration: 6.0+(index*0.2) , delay: (index*0.2), options: [.curveEaseInOut ,.autoreverse,.repeat], animations: {
      self.contentView.transform = CGAffineTransform(translationX: 5.0, y: 30.0)
    }, completion: {_ in})
  }
}

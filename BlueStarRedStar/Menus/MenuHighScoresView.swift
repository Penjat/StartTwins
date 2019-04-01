

import UIKit

class MenuHighScoresView: UIView {
  @IBOutlet weak var highScore1: HighScoreView!
  @IBOutlet weak var highScore2: HighScoreView!
  @IBOutlet weak var highScore3: HighScoreView!
  @IBOutlet weak var highScore4: HighScoreView!
  @IBOutlet weak var highScore5: HighScoreView!
  
  
  
  @IBOutlet var contentView: UIView!
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
    Bundle.main.loadNibNamed("MenuHighScores", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
  }

  @IBAction func pressedBack(_ sender: Any) {
    if let delegate = delegate{
      delegate.toTitle(withIntro: false)
    }
  }
  
  func setUp(scores:[HighScore]){
    let highScoreLabels = [highScore1,highScore2,highScore3,highScore4,highScore5]
    
    for i in 0..<5 {
      
      //check if there is a highscore
      //TODO could put placeholders or msg if none
      if i < scores.count{
        let score = scores[i]
        highScoreLabels[i]?.setUp(highScore: score)
        let translated = CGAffineTransform(translationX: 0, y: 800)
        highScoreLabels[i]?.transform = translated
        UIView.animate(withDuration: 2.0, delay: Double(i)*0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
          highScoreLabels[i]?.transform = CGAffineTransform(translationX: 0, y: 0)
        },completion:
          {_ in highScoreLabels[i]?.sway(index:Double(i))}
        )
        
        
      }else{
        //if no highscore yet hide the label
        highScoreLabels[i]?.isHidden = true
      }
      
      
    }
  }
  
}

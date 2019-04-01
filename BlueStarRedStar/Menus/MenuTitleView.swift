

import UIKit

class MenuTitleView: UIView , Menu{
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var titleView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var highScoresButton: UIButton!
  
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
    Bundle.main.loadNibNamed("MenuTitle", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    
    let gradient = CAGradientLayer()
    
    // gradient colors in order which they will visually appear
    gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor,UIColor.red.cgColor, UIColor.blue.cgColor]
    
    // Gradient from left to right
    gradient.startPoint = CGPoint(x: 0.0, y: 1)
    gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
    gradient.locations = [-2,-1,0,1]
    
    // set the gradient layer to the same size as the view
    gradient.frame = titleView.bounds
    // add the gradient layer to the views layer for rendering
    titleView.layer.addSublayer(gradient)
    titleView.mask = titleLabel
    
    let fromAnimation = CABasicAnimation(keyPath: "locations")
    fromAnimation.duration = 5.0
    fromAnimation.toValue = [0,1,2,3]
    fromAnimation.fillMode = CAMediaTimingFillMode.forwards
    fromAnimation.isRemovedOnCompletion = false
    fromAnimation.repeatCount = HUGE
    //fromAnimation.autoreverses = true
    gradient.add(fromAnimation, forKey: "locationChange")
    
    //startFadeIn()
  }
  @IBAction func pressedPlay(_ sender: Any) {
    if let delegate = delegate{
      delegate.toStartGame()
    }else{
      print("no delegate set")
    }
  }
  @IBAction func pressedHighScores(_ sender: Any) {
    if let delegate = delegate{
      delegate.toHighScores()
    }else{
      print("no delegate set")
    }
  }
  func startFadeIn(){
    titleView.alpha = 0.0
    playButton.alpha = 0.0
    highScoresButton.alpha = 0.0
    UIView.animateKeyframes(withDuration: 10.0, delay: 0.0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
        self.titleView.alpha = 1.0
      })
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
        self.playButton.alpha = 1.0
      })
      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.5, animations: {
        self.highScoresButton.alpha = 1.0
      })
    }, completion: {_ in})
   
  }
  
  func clear(menuCommand: MenuCommand) {
    switch menuCommand{
    case .StartGame:
      //startgame animation
      removeFromSuperview()
      break
    default:
      removeFromSuperview()
    }
  }
  
}

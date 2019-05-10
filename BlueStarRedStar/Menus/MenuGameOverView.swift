

import UIKit

class MenuGameOverView: UIView , Menu{
  @IBOutlet var contentView: UIView!
  
  var delegate : MenuDelegate?
  
  @IBOutlet weak var restartButton: UIButton!
  @IBOutlet weak var titleButton: UIButton!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("MenuGameOver", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    animateButtons()
  }
  func animateButtons(){
    
    restartButton.alpha = 0.0
    restartButton.transform = CGAffineTransform(translationX: 100.0, y: 0.0)
    
    titleButton.alpha = 0.0
    titleButton.transform = CGAffineTransform(translationX: 100.0, y: 0.0)
    
    
    UIView.animateKeyframes(withDuration: 4.0, delay: 4.0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
        self.restartButton.alpha = 1.0
        self.restartButton.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
      }
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
        self.titleButton.alpha = 1.0
        self.titleButton.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
      }
    }, completion: {_ in})
  }

  @IBAction func restartPressed(_ sender: Any) {
    if let delegate = delegate{
      delegate.restart()
    }else{
      print("no delegate set")
    }
    
  }
  @IBAction func pressedTitle(_ sender: Any) {
    if let delegate = delegate{
      delegate.toTitle(withIntro: false)
    }else{
      print("no delegate set")
    }
  }
  func clear(menuCommand: MenuCommand) {
    //TODO add more variation
    removeFromSuperview()
  }
}

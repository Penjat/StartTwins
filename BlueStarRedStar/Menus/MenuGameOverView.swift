

import UIKit

class MenuGameOverView: UIView , Menu{
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
    Bundle.main.loadNibNamed("MenuGameOver", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
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

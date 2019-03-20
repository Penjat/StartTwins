

import UIKit

class MenuHighScoresView: UIView {

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
      delegate.toTitle()
    }
  }
}

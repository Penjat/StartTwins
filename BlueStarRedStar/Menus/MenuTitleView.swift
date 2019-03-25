

import UIKit

class MenuTitleView: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var titleView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  
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
    gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
    
    // Gradient from left to right
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    
    // set the gradient layer to the same size as the view
    gradient.frame = titleView.bounds
    // add the gradient layer to the views layer for rendering
    titleView.layer.addSublayer(gradient)
    titleView.mask = titleLabel
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
  
}

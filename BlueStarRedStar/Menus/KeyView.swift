

import UIKit

class KeyView: UIView {

  @IBOutlet var contentView: UIView!
  @IBOutlet weak var keyLabel: UILabel!
  
  
  private func commonInit(){
    Bundle.main.loadNibNamed("Key", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    
    let tap = UITapGestureRecognizer(target: self, action:  #selector (self.pressSelf(_:) ))
    
    contentView.addGestureRecognizer(tap)
  }
  @objc func pressSelf(_ sender:UITapGestureRecognizer){
    print("I was pressed")
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func set(key:String){
    keyLabel.text = key
  }

  
}

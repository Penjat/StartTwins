

import UIKit

class KeyView: UIView {

  var delegate : KeyDelegate?
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var keyLabel: UILabel!
  
  
  let backColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.326359161)
  let borderColor = #colorLiteral(red: 0.3471710086, green: 0.1413548291, blue: 0.9731728435, alpha: 0.6901220034)
  let pressColor = #colorLiteral(red: 0.841042459, green: 0.6025169492, blue: 0.9570580125, alpha: 0.8432951627)
  let fontColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  
  
  private func commonInit(){
    Bundle.main.loadNibNamed("Key", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    
    contentView.layer.cornerRadius = 5;
    contentView.layer.masksToBounds = true;
    contentView.backgroundColor = backColor
    contentView.layer.borderColor = borderColor.cgColor
    contentView.layer.borderWidth = 3.0
    
    keyLabel.adjustsFontSizeToFitWidth = true
    keyLabel.textColor = fontColor
    
    let tap = UITapGestureRecognizer(target: self, action:  #selector (self.pressSelf(_:) ))
    
    contentView.addGestureRecognizer(tap)
  }
  @objc func pressSelf(_ sender:UITapGestureRecognizer){
    print("I was pressed")
    contentView.backgroundColor = pressColor
    UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
      self.contentView.backgroundColor = self.backColor
    }, completion: {_ in})
    if let delegate = delegate{
      delegate.press(value: keyLabel.text ?? "")
    }
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
  func set(delay:Double){
    contentView.alpha = 0.0
    contentView.transform = CGAffineTransform(translationX: 0.0, y: 100.0)
    UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
      self.contentView.alpha = 1.0
      self.contentView.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
    }, completion: {_ in})
  }

  
}

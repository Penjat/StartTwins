

import UIKit

class NewHighScoreView: UIView , Menu{

  @IBOutlet var contentView: UIView!
  var delegate : MenuDelegate?
  
  @IBOutlet weak var playerNameLabel: UILabel!
  
  @IBOutlet weak var keyboard: UIStackView!
  @IBOutlet weak var doneButton: UIButton!
  
  
  @IBOutlet weak var scoreLabel: UILabel!
  
  @IBOutlet weak var placeLabel: UILabel!

    override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    Bundle.main.loadNibNamed("MenuNewHighScore", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    playerNameLabel.text = ""
    //TODO animate keyboard in
    keyboard.isHidden = false
    doneButton.alpha = 0.0
    setUpKeyboard()
  }
  
  func setUpKeyboard(){
    var keyCount = 0
    keyCount = createKeyRow(["A","B","C","D","E","F","G"],keyCount: keyCount)
    keyCount = createKeyRow(["H","I","J","K","L","M","N"],keyCount: keyCount)
    keyCount = createKeyRow(["O","P","Q","R","S","T","U"],keyCount: keyCount)
    keyCount = createKeyRow(["V","W","X","Y","Z","<","DONE"],keyCount: keyCount)
    animateDoneButton(keyCount: keyCount)
    
  }
  func animateDoneButton(keyCount:Int){
    doneButton.transform = CGAffineTransform(translationX: 0.0, y: 100.0)
    
    UIView.animate(withDuration: 0.5, delay: 4.0 + (Double(keyCount)*0.04), options: [], animations: {
      self.doneButton.alpha = 1.0
      self.doneButton.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
    }, completion: {_ in})
    
  }
  func createKeyRow(_ keyNames:[String],keyCount:Int)->Int{
    var count = keyCount
    let keyRow = UIStackView(frame: CGRect.zero)
    keyRow.distribution = .fillEqually
    keyRow.spacing = 4.0
    
    for keyname in keyNames{
      let key = KeyView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
      key.set(key: keyname)
      key.delegate = self
      key.set(delay:4.0 + (Double(count)*0.04))
      keyRow.addArrangedSubview(key)
      count += 1
    }
    keyboard.addArrangedSubview(keyRow)
    
    return count
  }
  
  @IBAction func pressedDone(_ sender: Any) {
    if let delegate = delegate{
      delegate.enterHighScore(name: playerNameLabel.text!)
    }else{
      print("no delegate set")
    }
  }
  func set(score:Int){
    scoreLabel.text = "\(score)"
  }
  func set(place:Int){
    
    switch place{
    case 1:
      placeLabel.text = "1st"
      break
    case 2:
      placeLabel.text = "2nd"
      break
    case 3:
      placeLabel.text = "3rd"
      break
    default:
      placeLabel.text = "\(place)th"
      break
    }

  }
  func clear(menuCommand: MenuCommand) {
    //TODO add more variation
    removeFromSuperview()
  }
  
  
}

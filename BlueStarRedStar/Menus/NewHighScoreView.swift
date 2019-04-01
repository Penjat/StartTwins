

import UIKit

class NewHighScoreView: UIView , Menu{

  @IBOutlet var contentView: UIView!
  var delegate : MenuDelegate?
  
  @IBOutlet weak var keyboard: UIStackView!
  @IBOutlet weak var textFieldPlayerName: UITextField!
  
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
    //TODO animate keyboard in
    keyboard.isHidden = false
    setUpKeyboard()
  }
  func setUpKeyboard(){
    
    createKeyRow(["A","B","C","D","E","F","G"])
    createKeyRow(["H","I","J","K","L","M","N"])
    createKeyRow(["O","P","Q","R","S","T","U"])
    createKeyRow(["V","W","X","Y","Z","<","DONE"])
    
  }
  func createKeyRow(_ keyNames:[String]){
    
    let keyRow = UIStackView(frame: CGRect.zero)
    keyRow.distribution = .fillEqually
    keyRow.spacing = 4.0
    
    for keyname in keyNames{
      let key = KeyView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
      key.set(key: keyname)
      keyRow.addArrangedSubview(key)
    }
    keyboard.addArrangedSubview(keyRow)
    
    
  }
  
  @IBAction func pressedDone(_ sender: Any) {
    if let delegate = delegate{
      delegate.enterHighScore(name: textFieldPlayerName.text!)
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

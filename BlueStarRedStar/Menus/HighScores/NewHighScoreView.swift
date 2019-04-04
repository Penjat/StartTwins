

import SpriteKit

class NewHighScoreView: UIView , Menu{

  @IBOutlet var contentView: UIView!
  var delegate : MenuDelegate?
  
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var letterLabel: UILabel!
  
  @IBOutlet weak var keyboard: UIStackView!
  @IBOutlet weak var doneButton: UIButton!
  
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var highScoreGradientCon: UIView!
  @IBOutlet weak var highScoreLabel: UILabel!
  
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
    letterLabel.adjustsFontSizeToFitWidth = true
    
    //TODO put in own function
    let gradient = CAGradientLayer()
    
    // gradient colors in order which they will visually appear
    let color1 = #colorLiteral(red: 0.9566636682, green: 0.9515314698, blue: 0, alpha: 1)
    let color2 = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    let color3 = #colorLiteral(red: 0.9244538546, green: 0, blue: 0, alpha: 1)
    let color4 = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    gradient.colors = [color1.cgColor, color2.cgColor,color3.cgColor, color4.cgColor,color1.cgColor, color2.cgColor,color3.cgColor, color4.cgColor]
    
    // Gradient from left to right
    gradient.startPoint = CGPoint(x: 0.0, y: 1)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    gradient.locations = [-2,-1.5,-1,-0.5,0,0.5,1,1.5]
    
    // set the gradient layer to the same size as the view
    gradient.frame = highScoreGradientCon.bounds
    // add the gradient layer to the views layer for rendering
    highScoreGradientCon.layer.addSublayer(gradient)
    highScoreGradientCon.mask = highScoreLabel
    
    let fromAnimation = CABasicAnimation(keyPath: "locations")
    fromAnimation.duration = 2.5
    fromAnimation.toValue = [0,0.5,1,1.5,2,2.5,3,3.5]
    fromAnimation.fillMode = CAMediaTimingFillMode.forwards
    fromAnimation.isRemovedOnCompletion = false
    fromAnimation.repeatCount = HUGE
    //fromAnimation.autoreverses = true
    gradient.add(fromAnimation, forKey: "locationChange")
    

    UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: [.repeat,.calculationModePaced], animations: {
      
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
        self.playerNameLabel.transform = CGAffineTransform(rotationAngle: -0.1)
      }
      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        self.playerNameLabel.transform = CGAffineTransform(rotationAngle: 0)
      }
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
        self.playerNameLabel.transform = CGAffineTransform(rotationAngle: 0.1)
      }
      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
        self.playerNameLabel.transform = CGAffineTransform(rotationAngle: 0)
      }

    }, completion: {_ in})
  }
  
  func setUpKeyboard(){
    var keyCount = 0
    keyCount = createKeyRow(["A","B","C","D","E","F","G"],keyCount: keyCount)
    keyCount = createKeyRow(["H","I","J","K","L","M","N"],keyCount: keyCount)
    keyCount = createKeyRow(["O","P","Q","R","S","T","U"],keyCount: keyCount)
    keyCount = createKeyRow(["V","W","X","Y","Z","⬅︎",""],keyCount: keyCount)
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

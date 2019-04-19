
import Cocoa

class EditLevelViewController: NSViewController {
  var level : Level!
  @IBOutlet weak var levelNameTextField: NSTextField!
  @IBOutlet weak var difficultyLabel: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    levelNameTextField.stringValue = level.name
    difficultyLabel.integerValue = level.difficulty
  }


  
  @IBAction func pressedPlus(_ sender: Any) {
    guard difficultyLabel.integerValue < 10 else{
      return
    }
    difficultyLabel.integerValue = difficultyLabel.integerValue + 1
    
  }
  @IBAction func pressedMinus(_ sender: Any) {
    guard difficultyLabel.integerValue > 0 else{
      return
    }
    difficultyLabel.integerValue = difficultyLabel.integerValue - 1
  }
  
  @IBAction func pressedSave(_ sender: Any) {
    level.name = levelNameTextField.stringValue
    level.difficulty = difficultyLabel.integerValue
    TableManager.shared.updateLevels()
    //TODO update difficulty
    dismiss(self)
  }
  
  func setUp(level:Level){
    self.level = level
  }
}

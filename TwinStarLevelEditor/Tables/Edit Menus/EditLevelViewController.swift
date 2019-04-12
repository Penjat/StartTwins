
import Cocoa

class EditLevelViewController: NSViewController {
  var level : Level!
  @IBOutlet weak var levelNameTextField: NSTextField!
  @IBOutlet weak var difficultyLabel: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    levelNameTextField.stringValue = level.name
  }


  
  @IBAction func pressedPlus(_ sender: Any) {
  }
  @IBAction func pressedMinus(_ sender: Any) {
  }
  
  @IBAction func pressedSave(_ sender: Any) {
    level.name = levelNameTextField.stringValue
    TableManager.shared.updateLevels()
    //TODO update difficulty
    dismiss(self)
  }
  
  func setUp(level:Level){
    self.level = level
  }
}

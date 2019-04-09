
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
  }
  
  func setUp(level:Level){
    //TODO connect all the UI elements
    self.level = level
    
  }
}

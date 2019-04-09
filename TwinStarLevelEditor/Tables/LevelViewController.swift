

import Cocoa

class LevelViewController: NSViewController {
  
  
  var levels : [Level]!
  
  @IBOutlet weak var levelTableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    TableManager.shared.levelViewController = self
    levels = RealmManager.getLevels()
    levelTableView.dataSource = self
    levelTableView.delegate = self
    
  }
  
  @IBAction func createLevel(_ sender: Any) {
    //TODO make sure it has unique name
    let level = Level()
    level.name = "level 1"
    levels.append(level)
    levelTableView.reloadData()
  }
  
}

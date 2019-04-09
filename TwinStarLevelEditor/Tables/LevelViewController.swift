
//

import Cocoa

class LevelViewController: NSViewController {
  
  @IBOutlet weak var levelTableView: NSTableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    levelTableView.dataSource = self
    levelTableView.delegate = self
  }
  
}

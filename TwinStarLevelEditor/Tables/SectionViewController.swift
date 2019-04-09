

import Cocoa

class SectionViewController: NSViewController {
  
  var sections = [Section]()
  
  @IBOutlet weak var sectionTableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    TableManager.shared.sectionViewController = self
    sectionTableView.dataSource = self
    sectionTableView.delegate = self
  }
  
}

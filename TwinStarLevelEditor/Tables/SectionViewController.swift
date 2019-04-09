

import Cocoa

class SectionViewController: NSViewController {
  @IBOutlet weak var sectionTableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    sectionTableView.dataSource = self
    sectionTableView.delegate = self
  }
  
}

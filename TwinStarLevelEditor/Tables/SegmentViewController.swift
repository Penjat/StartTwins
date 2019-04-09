

import Cocoa

class SegmentViewController: NSViewController {
  
  @IBOutlet weak var segmentTableView: NSTableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    segmentTableView.delegate = self
    segmentTableView.dataSource = self
  }
  
}

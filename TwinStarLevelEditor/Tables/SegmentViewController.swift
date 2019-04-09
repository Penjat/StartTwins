

import Cocoa

class SegmentViewController: NSViewController {
  
  var segments = [Segment]()
  
  @IBOutlet weak var segmentTableView: NSTableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    TableManager.shared.segmentViewController = self
    segmentTableView.delegate = self
    segmentTableView.dataSource = self
  }
  
}

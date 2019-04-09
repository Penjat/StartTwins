
import Cocoa

extension SegmentViewController : NSTableViewDataSource , NSTableViewDelegate{
  func numberOfRows(in tableView: NSTableView) -> Int {
    return segments.count
    
  }
}

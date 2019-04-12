
import Cocoa

extension SegmentViewController : NSTableViewDataSource , NSTableViewDelegate{
  func numberOfRows(in tableView: NSTableView) -> Int {
    return segments.count
    
  }
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    //set the current level to selected
    
    let segmentIndex = segmentTableView.selectedRow
    //TODO do a check to make sure is in range
    TableManager.shared.setCur(segment: segments[segmentIndex])
    
  }
}


import Cocoa

extension SegmentViewController : NSTableViewDataSource , NSTableViewDelegate{
  func numberOfRows(in tableView: NSTableView) -> Int {
    return segments.count
    
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
    let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "segmentCell"), owner: nil) as? LevelCell
    
    
    cell?.textField?.stringValue = "\(row)"
    
    return cell
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    //set the current level to selected
    
    let segmentIndex = segmentTableView.selectedRow
    //TODO do a check to make sure is in range
    guard segmentIndex < segments.count , segmentIndex >= 0 else{
      return
    }
    
    TableManager.shared.setCur(segment: segments[segmentIndex])
    
  }
}



import Cocoa

extension LevelViewController : NSTableViewDataSource , NSTableViewDelegate {
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return levels.count
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
    let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "levelCell"), owner: nil) as? NSTableCellView
    cell?.textField?.stringValue = "assmass"

    return cell
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    //set the current level to selected
    
    let levelIndex = levelTableView.selectedRow
    //TODO do a check to make sure is in range
    TableManager.shared.setCur(level: levels[levelIndex])
    
    
  }
}

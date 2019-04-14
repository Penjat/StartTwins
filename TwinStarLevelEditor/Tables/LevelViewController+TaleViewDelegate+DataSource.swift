

import Cocoa

extension LevelViewController : NSTableViewDataSource , NSTableViewDelegate {
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return levels.count
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
    let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "levelCell"), owner: nil) as? NSTableCellView
    
    //TODO make sure in range
    cell?.textField?.stringValue = levels[row].name
    
    return cell
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    let levelIndex = levelTableView.selectedRow
    guard levelIndex < levels.count , levelIndex >= 0 else{
      return
    }
    
    let pressedLevel = levels[levelIndex]
    
    //set the current level to selected
    
    //TODO do a check to make sure is in range
    TableManager.shared.setCur(level: pressedLevel)
    
  }
}

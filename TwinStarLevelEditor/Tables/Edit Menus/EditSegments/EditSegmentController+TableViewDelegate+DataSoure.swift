

import Cocoa

extension EditSegmentViewController : NSTableViewDelegate, NSTableViewDataSource{
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return ToolManager.shared.tools.count
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
    let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "toolCell"), owner: nil) as? NSTableCellView
    //TODO custom cell class
    
    cell?.textField?.stringValue = ToolManager.shared.tools[row].name
    //TODO set name
    //cell?.textField?.stringValue = levels[row].name
    
    return cell
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    let tools = ToolManager.shared.tools
    let toolIndex = toolTableView.selectedRow
    guard toolIndex < tools.count , toolIndex >= 0 else{
      return
    }
    curTool = tools[toolIndex]
    
  }
  
  
}

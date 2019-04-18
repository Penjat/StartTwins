

import Cocoa

extension SectionViewController : NSTableViewDataSource, NSTableViewDelegate{
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return sections.count
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
    let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "sectionCell"), owner: nil) as? NSTableCellView
    
    //TODO make sure in range
    cell?.textField?.stringValue = "\(sections[row].orderID)"
    
    return cell
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    //set the current level to selected
    
    let sectionIndex = sectionTableView.selectedRow
    //check if in range
    
    guard sectionIndex < sections.count , sectionIndex >= 0  else{
      return
    }
  
    TableManager.shared.setCur(section: sections[sectionIndex])
    
  }
  
}

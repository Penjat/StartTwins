

import Cocoa

extension SectionViewController : NSTableViewDataSource, NSTableViewDelegate{
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return sections.count
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

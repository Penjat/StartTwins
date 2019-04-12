

import Cocoa

extension SectionViewController : NSTableViewDataSource, NSTableViewDelegate{
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return sections.count
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    
    //set the current level to selected
    
    let sectionIndex = sectionTableView.selectedRow
    //TODO do a check to make sure is in range
    TableManager.shared.setCur(section: sections[sectionIndex])
    
  }
  
}

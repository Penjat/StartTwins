

import Cocoa

extension LevelViewController : NSTableViewDataSource , NSTableViewDelegate {
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return 7
  }
}

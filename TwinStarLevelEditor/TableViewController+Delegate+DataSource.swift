

import Cocoa


extension TableViewController : NSTableViewDelegate, NSTableViewDataSource{
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return 7
  }
  
  
}

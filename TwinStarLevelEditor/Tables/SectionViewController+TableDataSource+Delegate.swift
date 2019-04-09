

import Cocoa

extension SectionViewController : NSTableViewDataSource, NSTableViewDelegate{
  func numberOfRows(in tableView: NSTableView) -> Int {
    return 4
  }
}

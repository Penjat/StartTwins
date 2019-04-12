

import Cocoa

class TableViewController: NSViewController {
  
  @IBOutlet weak var myTableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  override func viewDidAppear() {
    super.viewDidAppear()
    myTableView.dataSource = self
    myTableView.delegate = self
  }
  
}

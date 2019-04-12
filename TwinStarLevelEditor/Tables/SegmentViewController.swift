

import Cocoa

class SegmentViewController: NSViewController {
  
  var segments = [Segment]()
  
  @IBOutlet weak var segmentTableView: NSTableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    TableManager.shared.segmentViewController = self
    segmentTableView.delegate = self
    segmentTableView.dataSource = self
  }
  @IBAction func createSegment(_ sender: Any) {
    //check if there is a current section
    if let curSection = TableManager.shared.curSection{
      let segment = Segment()
      curSection.segments.append(segment)
      updateTable()
      return
    }
    //if no section selected
    print("please select a section")
  }
  
  func updateTable(){
    segments = TableManager.shared.getSegments()
    segmentTableView.reloadData()
  }
  
  @IBAction func pressedEdit(_ sender: Any) {
    print("pressed edit")
    guard TableManager.shared.curSegment != nil else{
      print("please select a segment")
      return
    }
    
    performSegue(withIdentifier: "editSegment", sender: nil)
  }
  
}

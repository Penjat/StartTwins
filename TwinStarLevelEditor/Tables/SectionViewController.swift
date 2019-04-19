

import Cocoa

class SectionViewController: NSViewController {
  
  var sections = [Section]()
  
  @IBOutlet weak var sectionTableView: NSTableView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    TableManager.shared.sectionViewController = self
    sectionTableView.dataSource = self
    sectionTableView.delegate = self
  }
  @IBAction func createSection(_ sender: Any) {
    
    //check if there is a cur level
    if let curLevel = TableManager.shared.curLevel{
      print("creating a new section")
      let section = Section()
      
      //auto increment the section order
      let orderID = curLevel.sections.count
      section.orderID = orderID
      section.speed = 250
      
      curLevel.sections.append(section)
      updateTable()
      return
    }
    
    //if no current level
    print("you must select a level before creating a section")
  }
  @IBAction func pressedEdit(_ sender: Any) {
    print("pressed edit")
    guard TableManager.shared.curSection != nil else{
      print("please select a section")
      return
    }
    
    performSegue(withIdentifier: "editSection", sender: nil)
  }
  
  func updateTable(){
    sections = TableManager.shared.getSections()
    sectionTableView.reloadData()
  }
  
}

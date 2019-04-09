

import Cocoa

class LevelViewController: NSViewController {
  
  
  var levels : [Level]!
  
  @IBOutlet weak var levelTableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    TableManager.shared.levelViewController = self
    levels = RealmManager.getLevels()
    levelTableView.dataSource = self
    levelTableView.delegate = self
    
  }
  
  @IBAction func createLevel(_ sender: Any) {
    //TODO make sure it has unique name
    let level = Level()
    level.name = "level 1"
    levels.append(level)
    levelTableView.reloadData()
  }
  @IBAction func pressedEdit(_ sender: Any) {
    print("pressed edit")
    guard TableManager.shared.curLevel != nil else{
      print("please select a level")
      return
    }
    
    performSegue(withIdentifier: "editLevel", sender: nil)
  }
  override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
    if segue.identifier == "editLevel"{
      let editLevelVC = segue.destinationController as! EditLevelViewController
      editLevelVC.setUp(level: TableManager.shared.curLevel!)
    }
  }
  func updateTable(){
    
    levelTableView.reloadData()
  }
  
}

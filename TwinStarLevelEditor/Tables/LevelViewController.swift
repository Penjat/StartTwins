

import Cocoa

class LevelViewController: NSViewController {
  
  
  var levels : [Level]!
  
  @IBOutlet weak var levelTableView: NSTableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    TableManager.shared.levelViewController = self
    loadLevels()
    levelTableView.dataSource = self
    levelTableView.delegate = self
    
  }
  func loadLevels(){
    //TODO put this elsewhere
    
    
    levels = [Level]()
    let realmLevels = RealmManager.getLevels()
    for realmLevel in realmLevels{
      let level = Level(value:realmLevel)
      level.parseSections()
      levels.append(level)
    }
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

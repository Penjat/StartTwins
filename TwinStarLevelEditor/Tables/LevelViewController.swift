

import Cocoa

class LevelViewController: NSViewController {
  
  var levelColors = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
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
    
    //parse levels to break realm connection
    //allows for editing without nessesaraly saving 
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
  
  func remove(level: Level){
    if let index = levels.index(of:level){
      levels.remove(at: index)
    }
  }
  
}

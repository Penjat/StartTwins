

import Cocoa


class EditorWindowController: NSWindowController {
  var curLevelItem : NSMenuItem?

  override func windowDidLoad() {
    super.windowDidLoad()
    let mainMenu = NSApplication.shared.mainMenu
    let sectionsMenuItem = mainMenu?.item(at: 3)

    let item = NSMenuItem(title: "Assmass", action: nil, keyEquivalent: "P")
    sectionsMenuItem?.submenu?.addItem(item)
    
    updateLevelMenu()
    
  }
  
  @IBAction func deleteAll(_ sender: Any) {
    RealmManager.deleteAll()
  }
  
  @IBAction func printAll(_ sender: Any) {
    RealmManager.printAll()
  }
  
  func updateLevelMenu(){
    let levels = RealmManager.getLevels()
    print("levels count = \(levels.count)")
    
    let mainMenu = NSApplication.shared.mainMenu
    let levelMenuItem = mainMenu?.item(at: 2)
    for level in levels{
      let item = NSMenuItem(title: level.name, action: #selector(select(levelItem:)), keyEquivalent: "P")
      levelMenuItem?.submenu?.addItem(item)
    }
   
  }
  @objc func select(levelItem:NSMenuItem){
    print("level selected")
    if let curLevelItem = curLevelItem{
      curLevelItem.state = .off
    }
    levelItem.state = .on
    curLevelItem = levelItem
  }
  
  @IBAction func pressedSave(_ sender: Any) {
    print("pressed save")
    TableManager.shared.saveTableData()
  }
  
  @IBAction func copyToApp(_ sender: Any) {
    RealmManager.copyToApp()
    
  }
  
  
}

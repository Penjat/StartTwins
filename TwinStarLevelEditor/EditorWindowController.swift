

import Cocoa

class EditorWindowController: NSWindowController {
  

  override func windowDidLoad() {
    super.windowDidLoad()
    let mainMenu = NSApplication.shared.mainMenu
    let sectionsMenuItem = mainMenu?.item(at: 3)

    let item = NSMenuItem(title: "Assmass", action: nil, keyEquivalent: "P")
    sectionsMenuItem?.submenu?.addItem(item)
    
  }
  @IBAction func newLevel(_ sender: Any) {
    print("create new level")
  }
  
}



import Cocoa
import RealmSwift


class ViewController: NSViewController {
  let tileManager = TileManager()

  @IBOutlet weak var containerView: NSView!
  
  
  func createGrid(){
    for var y in 0...10{
      for var x in 0...32{
        let tileView = TileView.init(frame: NSRect(x: 20+x*16, y: 20 + y*16, width: 15, height: 15))
        containerView.addSubview(tileView)
        tileView.delegate = tileManager
      }
    }
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createGrid()
    
    
    
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  
}


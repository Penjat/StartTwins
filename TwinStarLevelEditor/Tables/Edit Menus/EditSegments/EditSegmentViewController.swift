

import Cocoa
import RealmSwift


class EditSegmentViewController: NSViewController {
  
  let tileManager = TileManager()
  var pieces = [Piece]()

  @IBOutlet weak var heightTextField: NSTextField!
  
  

  @IBOutlet weak var containerView: NSView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tileManager.delegate = self
    createGrid()
    setUp()
  }
  
  func setUp(){
    //TODO set up all properties and show all pieces
    print("setting up")
    if let curSegment = TableManager.shared.curSegment{
      heightTextField.stringValue = "\(curSegment.height)"
    }
  }
  
  func createGrid(){
    for var y in 0...10{
      for var x in 0...32{
        let tileView = TileView.init(frame: NSRect(x: 20+x*16, y: 20 + y*16, width: 15, height: 15))
        tileView.setPosition(x: x, y: y)
        containerView.addSubview(tileView)
        tileView.delegate = tileManager
      }
    }
    
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  @IBAction func plusHeight(_ sender: Any) {
    
    var height = heightTextField.integerValue
    height += 1
    heightTextField.stringValue = "\(height)"
    
  }
  
  @IBAction func minusHeight(_ sender: Any) {
    
    var height = heightTextField.integerValue
    
    //dont go lower than 0
    //TODO perhaps 1 should be minimum value?
    if height == 0{
      return
    }
    height -= 1
    heightTextField.stringValue = "\(height)"
  }
  
  @IBAction func pressedSave(_ sender: Any) {
    print("pressed save")
    if let curSegment = TableManager.shared.curSegment{
      curSegment.height = heightTextField.integerValue
    }
    dismiss(self)
  }
  
  
}


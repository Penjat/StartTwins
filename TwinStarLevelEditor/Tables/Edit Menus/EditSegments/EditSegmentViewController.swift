

import Cocoa
import RealmSwift


class EditSegmentViewController: NSViewController {
  
  let tileManager = TileManager()
  var tiles = [[TileView]]()
  var pieces = [Piece]()
  
  var curTool : Tool?

  @IBOutlet weak var heightTextField: NSTextField!
  
  
  @IBOutlet weak var toolTableView: NSTableView!
  
  @IBOutlet weak var containerView: NSView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tileManager.delegate = self
    
    toolTableView.dataSource = self
    toolTableView.delegate = self
    
    setUp()
  }
  
  func setUp(){
    //TODO set up all properties and show all pieces
    print("setting up")
    if let curSegment = TableManager.shared.curSegment{
      
      //set the height in text field
      heightTextField.stringValue = "\(curSegment.height)"
      createGrid()
      //show all the pieces
      let pieces = curSegment.pieces.map{$0}
      for piece in pieces{
        create(piece:piece)
      }
    }
  }
  
  func createGrid(){
    let height = heightTextField.integerValue
    for y in 0...height{
      addRow()
    }
    
  }
  
  func addRow(){
    let y = tiles.count
    tiles.append([])
    for x in 0...32{
      let tileView = TileView.init(frame: NSRect(x: 20+x*16, y: 20 + y*16, width: 15, height: 15))
      
      tiles[y].append(tileView)
      tileView.setPosition(x: x, y: y)
      containerView.addSubview(tileView)
      tileView.delegate = tileManager
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
    addRow()
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
    
    //removes a row
    //TODO check for pieces that need to be deleted
    let row = tiles.removeLast()
    for tile in row{
      tile.removeFromSuperview()
    }
  }
  
  @IBAction func pressedSave(_ sender: Any) {
    print("pressed save")
    if let curSegment = TableManager.shared.curSegment{
      
      //save height
      curSegment.height = heightTextField.integerValue
      
      //save all pieces
      curSegment.pieces.removeAll()
      for piece in pieces{
        curSegment.add(piece: piece)
      }
      
    }
    dismiss(self)
  }
  
  func getTile(x:Int,y:Int) -> TileView{
    //this looks backwards but is correct
    return tiles[y][x]
  }
  
  
}


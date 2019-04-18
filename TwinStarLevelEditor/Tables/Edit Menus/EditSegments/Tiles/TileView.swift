

import Cocoa

class TileView: NSView {
  
  var delegate : TileDelegate?
  var position = (0,0)
  
  var fill = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
  let centerFill = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
  
  func setPosition(x:Int,y:Int){
    position = (x,y)
    if x == 15 || x == 16{
      fill = centerFill
    }
  }
  
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    fill.setFill()
    dirtyRect.fill()
  }
  override func viewDidMoveToWindow() {
    //print("moved to custom view")
    
  }
  override func mouseDown(with event: NSEvent) {
    if let delegate = delegate{
      delegate.clicked(tile: self)
    }
  }
  
}

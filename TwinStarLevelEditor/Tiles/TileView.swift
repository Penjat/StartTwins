

import Cocoa

class TileView: NSView {
  
  var delegate : TileDelegate?
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
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

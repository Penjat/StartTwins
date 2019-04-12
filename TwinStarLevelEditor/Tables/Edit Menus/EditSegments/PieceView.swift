

import Cocoa

class PieceView: NSView {
  
  

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
      #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).setFill()
      dirtyRect.fill()
    }
  
  override func mouseDown(with event: NSEvent) {
    print("a piece was clicked")
    removeFromSuperview()
  }
  
  
    
}



import Cocoa

class PieceView: NSView {
  
  var piece : Piece!
  var delegate : PieceViewDelegate?
  var myColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)

  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    
    // Drawing code here.
    myColor.setFill()
    dirtyRect.fill()
  }
  
  override func mouseDown(with event: NSEvent) {
    print("a piece was clicked")
    if let delegate = delegate{
      delegate.clicked(pieceView: self)
    }
    
  }
  
  
  
  
  
}



import Cocoa

class EditSegmentController: NSViewController {
  lazy var window: NSWindow = self.view.window!
  
  @IBOutlet weak var testBox: NSBox!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
    NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
      print("mouseLocation:", String(format: "%.1f, %.1f", self.mouseLocation.x, self.mouseLocation.y))
      print("windowLocation:", String(format: "%.1f, %.1f", self.location.x, self.location.y))
      
//      self.testBox.frame = CGRect(x: 0, y: 0, width: self.mouseLocation.x, height: self.mouseLocation.y)
      self.testBox.frame = CGRect(x: self.mouseLocation.x + self.location.x, y: self.mouseLocation.y + self.location.y, width: 20, height: 20)
      return $0
    }
  }
  
  var mouseLocation: NSPoint {
    return NSEvent.mouseLocation
  }
  var location: NSPoint {
    return window.mouseLocationOutsideOfEventStream
  }
  
}

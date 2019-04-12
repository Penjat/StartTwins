

import Cocoa

class EditSectionViewController: NSViewController {
  
  
  
  @IBOutlet weak var orderIDField: NSTextField!
  @IBOutlet weak var distanceField: NSTextField!
  @IBOutlet weak var speedField: NSTextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //TODO posibly dismis if no current section
      if let curSection = TableManager.shared.curSection{
        orderIDField.stringValue = "\(curSection.orderID)"
        distanceField.stringValue = "\(curSection.distance)"
        speedField.stringValue = "\(curSection.speed)"
        
      }
    }
  @IBAction func pressedSave(_ sender: Any) {
    print("pressed save")
    
    if let curSection = TableManager.shared.curSection{
      
       curSection.orderID = orderIDField.integerValue
       curSection.distance = distanceField.integerValue
       curSection.speed = speedField.integerValue
      
    }
    //TODO display a message
    dismiss(self)
    
  }
  
}



import Foundation
import RealmSwift

class HighScore : Object{
  @objc dynamic var score = 0
  @objc dynamic var playerName = ""
  @objc dynamic var date : Date?
  
}

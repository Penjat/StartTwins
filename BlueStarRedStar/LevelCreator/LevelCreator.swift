

import Foundation
import RealmSwift

class LevelCreator{
  
  static func createLevels(realm:Realm){
    print("creating levels")
    createLevel1(realm:realm)
  }
}

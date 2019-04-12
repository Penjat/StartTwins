

import Foundation
import RealmSwift

class RealmManager{
  static func getLevels()-> [Level]{
    //return all the levels
    let realm = try! Realm()
    
    let levels: [Level] = { realm.objects(Level.self) }().map{$0}
    
    return levels
  }
  
  static func deleteAll(){
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }
  static func printAll(){
    
    let levels = getLevels()
    print("there are \(levels.count) levels")
    
    var i = 0
    for level in levels{
      i += 1
      print("\(i) - \(level.name)")
    }
    
  }
}

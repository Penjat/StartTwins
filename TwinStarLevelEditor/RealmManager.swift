

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
}

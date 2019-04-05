

import Foundation
import RealmSwift

class LevelManager{
  
  let realm = try! Realm()
  let startClean = false//for debugging, when true deletes all data on device
  
  func setUp(){
    
    //for debugging level creator
    if startClean {
      deleteAllData()
    }
    
    let levels: Results<Level> = { realm.objects(Level.self) }()
    
    if levels.count == 0{
      print("No levels yet created")
      //LevelCreator.createLevels(realm: realm)
    }else{
      print("There are \(levels.count) levels")
    }
    
    print(Realm.Configuration.defaultConfiguration.fileURL!)
  }
  
  func getLevel()->Level{
//    let segments = realm.objects(Level.self).first!.sections.first!.segments
    
    let levels: Results<Level> = { realm.objects(Level.self) }()
    let level = levels.first
    print("level name = \(level!.name)")
    
    if let section = level?.sections.first{
      print("section distance is \(section.distance)")
      if let segment = section.segments.first , let piece = segment.pieces.first{
        print("piece is \(piece)")
      }
    }
    return level!
  }
  func deleteAllData(){
    try! realm.write {
      realm.deleteAll()
    }
  }
}


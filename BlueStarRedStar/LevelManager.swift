

import Foundation
import RealmSwift

class LevelManager{
  
  let realm = try! Realm()
  
  
  func setUp(){
    
    
    let levels: Results<Level> = { realm.objects(Level.self) }()
    if levels.count == 0{
      print("No levels yet created")
      LevelCreator.createLevels(realm: realm)
    }else{
      print("There are \(levels.count) levels")
    }
    
    print(Realm.Configuration.defaultConfiguration.fileURL!)
  }
  
  func getLevel(){
    let levels: Results<Level> = { realm.objects(Level.self) }()
    let level = levels.first
    print("level name = \(level!.name)")
    
    if let section = level?.sections.first{
      print("section distance is \(section.distance)")
      if let segment = section.segments.first , let piece = segment.pieces.first{
        print("piece is \(piece)")
      }
    }
  }
}


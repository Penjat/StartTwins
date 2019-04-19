

import Foundation
import RealmSwift

class LevelManager{
  
  let realm = try! Realm(fileURL: Bundle.main.url(forResource: "default", withExtension: "realm")!)
  
  
  func setUp(){
    print("getting realm file location")
    
    
    
    
    
  }
  
  func getLevel(difficulty:Int? = nil)->Level{
    print("getting level")
//    let segments = realm.objects(Level.self).first!.sections.first!.segments
    
    //check if looking for
    if let difficulty = difficulty{
      //TODO refactor into two functions
      let levels: Results<Level> = { realm.objects(Level.self).filter("difficulty == \(difficulty)") }()
      
      
      if let level = levels.randomElement(){
        print("level name = \(level.name)")
        setUpSectionSegment(level:level)
        return level
      }
      print("could not find level with difficulty \(difficulty)")
    }
    
    print("finding any level")
    //if can't find a level with that difficulty return any
    let levels: Results<Level> = { realm.objects(Level.self) }()
    let level = levels.randomElement()
    setUpSectionSegment(level:level!)
    return level!
    
  }
  func setUpSectionSegment(level:Level){
    if let section = level.sections.first{
      print("section distance is \(section.distance)")
      if let segment = section.segments.first , let piece = segment.pieces.first{
        print("piece is \(piece)")
      }
    }
  }
  
  
}


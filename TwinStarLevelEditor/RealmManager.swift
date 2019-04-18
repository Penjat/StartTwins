

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
    print(Realm.Configuration.defaultConfiguration.fileURL!)
    let levels = getLevels()
    print("there are \(levels.count) levels")
    
    var i = 0
    
    for level in levels{
      i += 1
      print("\(i) - \(level.name)")
      var sectionNum = 0
      for section in level.sections{
        print("  section - \(sectionNum)")
        sectionNum += 1
        var segmentNum = 0
        for segment in section.segments{
          print("   segment - \(segmentNum)")
          print("     \(segment.pieces.count) pieces")
          segmentNum += 1
        }
      }
    }

  }
  static func save(levels:[Level]){
    
    let realm = try! Realm()
    try! realm.write {
      
      
      for level in levels{
        realm.add(level,update: true)
      }
      
      
    }
  }
  static func copyToApp(){
    print("copying to app...")
    let defaultPath = Realm.Configuration.defaultConfiguration.fileURL?.path
    let path = "/Users/spencersymington/Desktop/Projects/BlueStarRedStar/BlueStarRedStar/Assets/default.realm"
    do {
      try FileManager.default.copyItem(atPath: defaultPath!, toPath:path )
    } catch {
      print("Error copying to StarTwins app \(error)")
    }
  }
}

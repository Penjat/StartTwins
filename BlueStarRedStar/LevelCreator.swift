

import Foundation
import RealmSwift

class LevelCreator{
  
  static func createLevels(realm:Realm){
    try! realm.write {
      let level = Level()
      level.name = "level 1"
      
      let section = Section()
      section.distance = 200
      section.speed = 30
      
      level.add(section: section)
      
      let segment = Segment()
      segment.height = 100
      
      section.add(segment: segment)
      
      let piece = Piece()
      piece.height = 1
      piece.width = 1
      piece.x = 0
      piece.y = 0
      piece.type = 1
      
      segment.add(piece: piece)
      
      
      
      realm.add(level)
    }
  }
}

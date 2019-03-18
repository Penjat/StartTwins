

import Foundation
import RealmSwift

class LevelCreator{
  
  static func createLevels(realm:Realm){
    try! realm.write {
      let level = Level()
      level.name = "level 1"
      
      //section 1
      let sec1 = Section()
      sec1.distance = 700
      sec1.speed = 30
      
      level.add(section: sec1)
      
      //section 1 segment 1
      let sec1_seg1 = Segment()
      sec1_seg1.height = 100
      
      sec1.add(segment: sec1_seg1)
      
      let sec1_seg1_piece1 = Piece()
      sec1_seg1_piece1.height = 1
      sec1_seg1_piece1.width = 1
      sec1_seg1_piece1.x = 3
      sec1_seg1_piece1.y = 0
      sec1_seg1_piece1.type = 1
      
      sec1_seg1.add(piece: sec1_seg1_piece1)
      
      
      //section 1 segment 2
      let sec1_seg2 = Segment()
      sec1_seg2.height = 100
      
      sec1.add(segment: sec1_seg2)
      
      let piece2 = Piece()
      piece2.height = 1
      piece2.width = 1
      piece2.x = 2
      piece2.y = 0
      piece2.type = 1
      
      sec1_seg2.add(piece: piece2)
      
      let piece3 = Piece()
      piece3.height = 1
      piece3.width = 1
      piece3.x = -2
      piece3.y = 0
      piece3.type = 1
      
      sec1_seg2.add(piece: piece3)
      
      //section 2
      let sec2 = Section()
      sec2.distance = 700
      sec2.speed = 30
      level.add(section: sec2)
      
      //section 2 segment 1
      let sec2_seg2 = Segment()
      sec2_seg2.height = 100
      
      sec2.add(segment: sec2_seg2)
      
      let piece4 = Piece()
      piece4.height = 1
      piece4.width = 1
      piece4.x = 5
      piece4.y = 0
      piece4.type = 1
      
      sec2_seg2.add(piece: piece4)
   
      
      
      realm.add(level)
    }
  }
}

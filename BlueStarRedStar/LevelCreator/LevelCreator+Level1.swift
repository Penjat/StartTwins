

import RealmSwift

extension LevelCreator{
  
  static func createLevel1(realm:Realm){
    
    try! realm.write {
      let level = Level()
      level.name = "level 1"
      
      //---------------------------section 1---------------------------
      let sec1 = Section()
      sec1.distance = 200
      sec1.speed = 30
      
      level.add(section: sec1)
      
//      //---------------section 1 segment 1
//      let sec1_seg1 = Segment()
//      sec1_seg1.height = 16
//      sec1.add(segment: sec1_seg1)
//
//
//      sec1_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 3, y:0, width: 2, height: 2, color: 1))
//
//      sec1_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -3, y:0, width: 2, height: 2, color: 2))
//
//      sec1_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 2, y:8, width: 2, height: 2, color: 2))
//
//      sec1_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -2, y:8, width: 2, height: 2, color: 1))
//
//
//      //---------------section 1 segment 2
//      let sec1_seg2 = Segment()
//      sec1_seg2.height = 5
//      sec1.add(segment: sec1_seg2)
//
//      sec1_seg2.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: 0, y:0, width: 12, height: 2, color: 1))
//
//      //---------------section 1 segment 3
//      let sec1_seg3 = Segment()
//      sec1_seg3.height = 5
//      sec1.add(segment: sec1_seg3)
//
//      sec1_seg3.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: 4, y:0, width: 3, height: 1, color: 1))
//      sec1_seg3.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: -4, y:0, width: 3, height: 1, color: 1))
//
//      //---------------section 1 segment 4
//      let sec1_seg4 = Segment()
//      sec1_seg4.height = 5
//      sec1.add(segment: sec1_seg4)
//
//      sec1_seg4.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: 13, y:0, width: 6, height: 1, color: 1))
//      sec1_seg4.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: -13, y:0, width: 6, height: 1, color: 1))
      
//      //---------------section 1 segment 5
//      let sec1_seg5 = Segment()
//      sec1_seg5.height = 4
//      sec1.add(segment: sec1_seg5)
//
//      sec1_seg5.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: 10, y:1, width: 12, height: 2, color: 1))
//      sec1_seg5.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: -10, y:1, width: 12, height: 2, color: 1))
//      sec1_seg5.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:1, width: 2, height: 2, color: 2))
      
      //---------------section 1 segment 6
      let sec1_seg6 = Segment()
      sec1_seg6.height = 100
      sec1.add(segment: sec1_seg6)
      
      sec1_seg6.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: 8, y:50, width: 10, height: 98, color: 1))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: -8, y:50, width: 10, height: 98, color: 1))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:4, width: 2, height: 2, color: 2))
      
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:12, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:20, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:28, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:36, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:44, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:52, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:60, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:68, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:76, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:84, width: 2, height: 2, color: 2))
      sec1_seg6.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:92, width: 2, height: 2, color: 2))
      
      //---------------------------section 2---------------------------
      let sec2 = Section()
      sec2.distance = 200
      sec2.speed = 30
      
      level.add(section: sec2)
      
      
      //---section 2 segment 1
      let sec2_seg1 = Segment()
      sec2_seg1.height = 24
      sec2.add(segment: sec2_seg1)



      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:0, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -1, y:0, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 2, y:2, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -2, y:2, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 3, y:4, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -3, y:4, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 4, y:6, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -4, y:6, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 5, y:8, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -5, y:8, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 6, y:10, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -6, y:10, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 5, y:12, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -5, y:12, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 4, y:14, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -4, y:14, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 3, y:16, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -3, y:16, width: 2, height: 2, color: 2))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 2, y:18, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -2, y:18, width: 2, height: 2, color: 2))
      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:20, width: 2, height: 2, color: 1))

      sec2_seg1.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -1, y:20, width: 2, height: 2, color: 2))
      
      //---section 2 segment 2
      let sec2_seg2 = Segment()
      sec2_seg2.height = 24
      sec2.add(segment: sec2_seg2)
      
      
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:0, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -1, y:0, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 2, y:2, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -2, y:2, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 3, y:4, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -3, y:4, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 4, y:6, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -4, y:6, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 5, y:8, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -5, y:8, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 6, y:10, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -6, y:10, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 5, y:12, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -5, y:12, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 4, y:14, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -4, y:14, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 3, y:16, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -3, y:16, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 2, y:18, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -2, y:18, width: 2, height: 2, color: 1))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 1, y:20, width: 2, height: 2, color: 2))
      
      sec2_seg2.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -1, y:20, width: 2, height: 2, color: 2))
      
      //---section 2 segment 2
      let sec2_seg3 = Segment()
      sec2_seg3.height = 14
      sec2.add(segment: sec2_seg3)
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Wall.rawValue, x: 0, y:5, width: 1, height: 10, color: 2))
      
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 4, y:0, width: 2, height: 2, color: 2))
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 6, y:4, width: 2, height: 2, color: 2))
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: 2, y:8, width: 2, height: 2, color: 2))
      
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -8, y:2, width: 2, height: 2, color: 1))
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -8, y:6, width: 2, height: 2, color: 1))
      
      sec2_seg3.add(piece: Piece.create(type: PieceType.Coin.rawValue, x: -4, y:10, width: 2, height: 2, color: 1))
      
      
      
//      //section 1 segment 2
//      let sec1_seg2 = Segment()
//      sec1_seg2.height = 100
//
//      sec1.add(segment: sec1_seg2)
//
//
//
//      let piece3 = Piece()
//      piece3.height = 1
//      piece3.width = 1
//      piece3.x = -2
//      piece3.y = 0
//      piece3.type = PieceType.Wall.rawValue
//
//
//      sec1_seg2.add(piece: piece3)
//
//      //section 2
//      let sec2 = Section()
//      sec2.distance = 700
//      sec2.speed = 30
//      level.add(section: sec2)
//
//      //section 2 segment 1
//      let sec2_seg2 = Segment()
//      sec2_seg2.height = 100
//
//      sec2.add(segment: sec2_seg2)
//
//      let piece4 = Piece()
//      piece4.height = 1
//      piece4.width = 1
//      piece4.x = 5
//      piece4.y = 0
//      piece4.type = PieceType.Wall.rawValue
//
//
//      sec2_seg2.add(piece: piece4)
      
      
      
      realm.add(level)
    }
  }
}

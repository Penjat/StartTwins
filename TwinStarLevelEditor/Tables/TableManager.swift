
//Manages the state of all tables

import Cocoa

class TableManager {
  
  
  
  static let shared = TableManager()
  
  var levelViewController : LevelViewController?
  var sectionViewController : SectionViewController?
  var segmentViewController : SegmentViewController?
  
  var curLevel : Level?
  var curSection : Section?
  var curSegment : Segment?
  
  func setCur(level:Level){
    print("setting cur level")
    curLevel = level
  }
  func setCur(section:Section){
    curSection = section
  }
  func setCur(segment:Segment){
    curSegment = segment
  }
  
  
  
  func getSections(){
    
  }
  
}


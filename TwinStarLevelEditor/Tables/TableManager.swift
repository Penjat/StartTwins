
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
    updateSections()
  }
  func setCur(section:Section){
    curSection = section
  }
  func setCur(segment:Segment){
    curSegment = segment
  }
  
  func updateSections(){
    print("updating sections")
    //TODO maybe change this
    sectionViewController?.updateTable()
    updateSegments()
  }
  func updateSegments(){
    print("updating segments")
  }
  
  
  
  func getSections()->[Section]{
    
    //check if there is a current level
    if let curLevel = curLevel{
      return curLevel.sections.map{$0}
    }
    
    //if not return empty array
    return []
  }
  
}


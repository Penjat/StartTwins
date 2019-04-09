
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
    
    //update the current section, try for first in array
    if let curLevel = curLevel, let section = curLevel.sections.first {
      setCur(section: section)
    }else{
      setCur(section: nil)
    }
  
    //get the sections for the current level
    updateSections()
    
    
    //TODO set selected on table
    
    
    
    
    
  }
  func setCur(section:Section?){
    curSection = section
    
    //check if nil
    if let curSection = curSection , let segment = curSection.segments.first{
      setCur(segment: segment)
    }else{
      setCur(segment: nil)
    }
    updateSegments()
  }
  func setCur(segment:Segment?){
    curSegment = segment
  }
  func updateLevels(){
    levelViewController?.updateTable()
  }
  func updateSections(){
    print("updating sections")
    sectionViewController?.updateTable()
    
  }
  func updateSegments(){
    print("updating segments")
    segmentViewController?.updateTable()
  }
  
  
  
  func getSections()->[Section]{
    
    //check if there is a current level
    if let curLevel = curLevel{
      return curLevel.sections.map{$0}
    }
    
    //if not return empty array
    return []
  }
  func getSegments()->[Segment]{
    
    //check if there is a current section
    if let curSection = curSection{
      return curSection.segments.map{$0}
    }
    
    //if not return empty array
    return []
  }
  
}


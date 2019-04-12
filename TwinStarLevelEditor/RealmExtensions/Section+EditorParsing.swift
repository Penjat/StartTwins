

import RealmSwift

extension Section{
  func parseSegments(){
    var parsedSegemnts = [Segment]()
    for realmSegement in segments{
      let segment = Segment(value:realmSegement)
      parsedSegemnts.append(segment)
    }
    segments.removeAll()
    for segment in parsedSegemnts{
      segments.append(segment)
    }
    
  
  }
}

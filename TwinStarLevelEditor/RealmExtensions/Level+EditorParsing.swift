

import RealmSwift

extension Level{
  func parseSections(){
    var parsedSections = [Section]()
    for realmSection in sections{
      let section = Section(value:realmSection)
      section.parseSegments()
      parsedSections.append(section)
    }
    sections.removeAll()
    for section in parsedSections{
      sections.append(section)
    }
    
  }
}

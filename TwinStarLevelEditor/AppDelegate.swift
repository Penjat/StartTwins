

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    
    print("app delegate loaded")
    
//
//    print(Realm.Configuration.defaultConfiguration.fileURL!)
//    let realm = try! Realm()
//    
//    LevelCreator.createLevels(realm: realm)
//    
//    if let levels: Results<Level> = { realm.objects(Level.self) }(), let level = levels.first{
//      print("level name = \(level.name)")
//    }else{
//      print("could not find any levels")
//    }
    
    
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}


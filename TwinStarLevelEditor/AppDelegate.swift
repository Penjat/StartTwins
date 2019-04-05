

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    print("app delegate loaded")
//    var config = Realm.Configuration(
//      schemaVersion: 0,
//      migrationBlock: { migration, oldSchemaVersion in
//        if (oldSchemaVersion < 1) {
//          // Nothing to do!
//          // Realm will automatically detect new properties and removed properties
//          // And will update the schema on disk automatically
//        }
//    })
////    config.fileURL = URL(fileURLWithPath: "file:///Users/spencersymington/Library/Developer/CoreSimulator/Devices/4265277D-5D94-4F4D-A05A-E080CE1543B6/data/Containers/Data/Application/20D09F60-DAA6-4C18-899A-B54FF9C8999D/Documents/default.realm")
//    config.deleteRealmIfMigrationNeeded = true
//    Realm.Configuration.defaultConfiguration = config
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




import Foundation
import RealmSwift

class HighScoreManager{
  
  static let numberOfHighScores = 5 //number of high scores we want to keep track of
  
  static func checkHigh(score:Int)->Int{
    let realm = try! Realm()
    
    
    let higherScores = realm.objects(HighScore.self).filter("score >= %@", score)
    
    //check if there is room on the scoreboard for the submited score
    return higherScores.count
  }
  static func saveHigh(score:Int , playerName:String){
    let realm = try! Realm()
    saveHigh(score: score, playerName: playerName, realm: realm)
  }
  static func saveHigh(score:Int , playerName:String ,realm:Realm){
    try! realm.write {
      let newHighScore = HighScore()
      newHighScore.date = Date()
      newHighScore.score = score
      newHighScore.playerName = playerName
      realm.add(newHighScore)
    }
  }
  
  static func removeExtraScores(){
    //TODO remove the extras
  }
  
  static func getHighScores()->[HighScore]{
    let realm = try! Realm()
    let highScores = realm.objects(HighScore.self).sorted(byKeyPath: "score", ascending: false)
    
    return highScores.map{$0}
  }
  static func createPlaceHolderScores(){
    
    let realm = try! Realm()
    
    let highScores: Results<HighScore> = { realm.objects(HighScore.self) }()
    
    if highScores.count == 0{
      print("No HighScores yet created, creating")
      saveHigh(score:500 , playerName:"HALLEY" ,realm:realm)
      saveHigh(score:400 , playerName:"ENCKE" ,realm:realm)
      saveHigh(score:300 , playerName:"SWIFT TURTLE" ,realm:realm)
      saveHigh(score:200 , playerName:"CHIRON" ,realm:realm)
      saveHigh(score:100 , playerName:"ISON" ,realm:realm)
      
    }else{
      print("There are \(highScores.count) levels")
    }
    
    
  }
}

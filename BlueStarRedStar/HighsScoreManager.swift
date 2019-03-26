

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
    let highScores = realm.objects(HighScore.self)
    
    return highScores.map{$0}
  }
}

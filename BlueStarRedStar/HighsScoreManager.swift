

import Foundation
import RealmSwift

class HighScoreManager{
  
  static let numberOfHighScores = 5 //number of high scores we want to keep track of
  
  static func checkHigh(score:Int)->Bool{
    let realm = try! Realm()
    
    
    let higherScores = realm.objects(HighScore.self).filter("score >= %@", score)
    
    //check if there is room on the scoreboard for the submited score
    return (higherScores.count < numberOfHighScores)
  }
}

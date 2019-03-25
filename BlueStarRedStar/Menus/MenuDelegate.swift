
import UIKit

protocol MenuDelegate {
  func toStartGame()
  func toTitle(withIntro: Bool)
  func toHighScores()
  func restart()
  func enterHighScore(name:String)
}


import UIKit

protocol MenuDelegate {
  func toStartGame()
  func toTitle()
  func toHighScores()
  func restart()
  func enterHighScore(name:String)
}

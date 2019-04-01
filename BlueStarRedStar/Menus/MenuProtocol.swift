

import Foundation

protocol Menu {
  func clear(menuCommand: MenuCommand)
}

enum MenuCommand{
  case None,StartGame
}

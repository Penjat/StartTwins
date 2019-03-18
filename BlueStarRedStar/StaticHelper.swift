

import Foundation
import SpriteKit

class StaticHelper{
  
  static var widthRatio : CGFloat!
  
  static func setRatio(scene:GameScene){
    widthRatio = scene.frame.width / 32.0
  }
}

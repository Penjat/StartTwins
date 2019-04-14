

import Foundation
import SpriteKit

class StaticHelper{
  
  static var widthRatio : CGFloat!
  static var centerOffset : CGFloat!
  
  static func setRatio(scene:GameScene){
    widthRatio = scene.frame.width / 32.0
  }
  static func setOffset(scene:GameScene){
    centerOffset = scene.frame.width / 2
  }
}



import Foundation
import SpriteKit

class StaticHelper{
  
  static var widthRatio : CGFloat!
  
  static var heightCount : CGFloat!
  //based on the width ratio, the number of squares that can be fit vertically
  
  static var centerOffset : CGFloat!
  static var speedModifier : CGFloat = 1.0
  static var moveSpeed : CGFloat = 0.0
  static var playerPos : CGFloat = 0.0
  
  
  //the amount that the speed increases after player cycles through the 10 levels
  static let speedRateOfIncrease : CGFloat = 0.5
  
  static func setRatio(scene:GameScene){
    widthRatio = scene.frame.width / 32.0
    
    heightCount = scene.frame.height / widthRatio
    
  }
  
  static func setOffset(scene:GameScene){
    centerOffset = scene.frame.width / 2
  }
  static func updateSpeedModifier(levelMod:Int){
    //use the modulus of the level number to increase the speed
    //levels begin repeating after 10 but the speed will increase
    
    speedModifier = 1.0 + speedRateOfIncrease*CGFloat(levelMod)
  }
}

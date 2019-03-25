

import SpriteKit

protocol PlayerDelegate {
  func shakeScreen()//TODO could put in shake amt
  func getMovingNode() -> SKNode
  func getStaticNode() -> SKNode
  func getScreenEdge() -> CGFloat
}

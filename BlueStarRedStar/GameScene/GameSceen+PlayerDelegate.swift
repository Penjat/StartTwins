

import SpriteKit

extension GameScene : PlayerDelegate{
  func getStaticNode() -> SKNode {
    return staticNode
  }
  
  func getMovingNode() -> SKNode {
    return movingNode
  }
  
  func shakeScreen(){
    //TODO could pass in shake level
    
    let amplitudeX:Float = 16;
    let amplitudeY:Float = 16;
    let numberOfShakes = 0.7 / 0.04;
    var actionsArray:[SKAction] = [];
    for _ in 1...Int(numberOfShakes) {
      let moveX = Float(arc4random_uniform(UInt32(amplitudeX))) - amplitudeX / 2;
      let moveY = Float(arc4random_uniform(UInt32(amplitudeY))) - amplitudeY / 2;
      let shakeAction = SKAction.moveBy(x: CGFloat(moveX), y: CGFloat(moveY), duration: 0.02);
      shakeAction.timingMode = SKActionTimingMode.easeOut;
      actionsArray.append(shakeAction);
      actionsArray.append(shakeAction.reversed());
    }
    
    let actionSeq = SKAction.sequence(actionsArray);
    staticNode.run(actionSeq);
    
  }
  //TODO move these to own extension
  func getScreenEdge() -> CGFloat{
    //TODO take out +100
    return ((frame.height+100)/2.0)
  }
  func getOffScreen() -> CGFloat{
    //returns just offscreen for the moving node
    //TODO factor in the node height
    return ((frame.height)/2.0) - movingNode.position.y
  }
  
  
}

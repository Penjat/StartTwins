
import Foundation
import SpriteKit


class PieceFactory{
  let levelManager = LevelManager()
  let NUM_OF_DIFF = 10
  
  var distNextSegment : CGFloat = 0.0
  var distNextSection : CGFloat = 0.0
  var sectionNumber = 0
  var levelNum = 0
  var level : Level?
  var curSection : Section?
  var segments : [Segment]?
  
  var isNewLevel = false
  
  var pieceList = [PieceNode]()
  
  init() {
    levelManager.setUp()
    
  }
  
  func startGame(scene:GameScene){
    //get a level
    //set everything to 0
    
    clearPieceList()
    levelNum = 0
    sectionNumber = 0
    distNextSection = 0
    distNextSegment = 0

    level = levelManager.getLevel(difficulty: levelNum)
    
    startLevel(scene: scene)
    scene.setMoving(speed:curSection!.speed)
  }
  func clearPieceList(){
    for piece in pieceList{
      piece.removeFromParent()
    }
    pieceList.removeAll()
  }
  
  
  func setCur(section:Section,scene:GameScene){
    
    curSection = section
    distNextSection = scene.movingNode.position.y - curSection!.getDistance()
    segments = curSection?.segments.map{$0}
    
  }
  
  func checkShouldCreateSegment(movingNode:SKNode) -> Bool{
    //print("moving node = \(movingNode.position.y) , dist = \(distNextSegment)")
     return distNextSegment > movingNode.position.y
  
  }
  func checkShouldChangeSection(movingNode:SKNode)->Bool{
    return distNextSection > movingNode.position.y
  }
  func moveToSection(){
    
  }
  func createSegment(scene:GameScene){
    if isNewLevel , let level = level {
      addLabel(level: level, scene: scene)
      distNextSegment = scene.movingNode.position.y - 600
      isNewLevel = false
      return
    }
    let segment = segments?.randomElement()
    
    if let pieces = segment?.pieces{
      for piece in pieces{
        createPiece(scene: scene, piece: piece)
      }
    }else{
      print("no piece array")
    }
    
    
    if let segment = segment{
      distNextSegment = scene.movingNode.position.y - segment.getHeight()
    }else{
      print("error unwrapping segment")
      distNextSegment = scene.movingNode.position.y - 50
    }
    
  }
  private func createPiece(scene:GameScene,piece:Piece){
  
    //TODO add to a piece list
    switch (PieceClass.get(pieceClass: piece.type)){
      
    case .Wall:
       let wall = Wall.create(scene: scene, piece: piece)
      pieceList.append(wall)
      
    case .Coin:
      let coin = Coin.create(scene: scene, piece: piece)
      pieceList.append(coin)
      
    case .Hobbin:
      let hobbin = Hobbin.create(scene: scene, piece: piece)
      pieceList.append(hobbin)
      
    case .Nobbin:
      let nobbin = Nobbin.create(scene: scene, piece: piece)
      pieceList.append(nobbin)
      
    case .Chobbin:
      let chobbin = Chobbin.create(scene: scene, piece: piece)
      pieceList.append(chobbin)
      
    case .Diamond:
      let diamond = Diamond.create(scene: scene, piece: piece)
      pieceList.append(diamond)
      
    }
  }
  
  
  
  func getSection()-> Section?{
    return level!.sections.filter("orderID == %@",sectionNumber).first
  }
  func nextSection(scene:GameScene)->Bool{
    //returns true if was sucsessful false if time for next level
    sectionNumber += 1
    print("section count = \(level!.sections.count)")
    if let section = getSection(){
      print("section \(sectionNumber) found")
      setCur(section: section, scene: scene)
      
      return true
    }
    
    print("could not find section \(sectionNumber), should move to next level")
    return false
    
    
  }
  func addLabel(level:Level , scene:GameScene){
    print("distNextSegment = \(distNextSegment)")
    print("offscreen = \(scene.getOffScreen())")
    let levelLabel = SKLabelNode(text: "level \(levelNum + 1)")
    levelLabel.fontName = "Atari Font Full Version"
    levelLabel.fontSize = 40
    let labelPos = scene.getOffScreen() > distNextSegment ? scene.getOffScreen() : distNextSegment
    levelLabel.position = CGPoint(x: 0, y: labelPos )
    
    //add fade
    let fadeOut = SKAction.sequence([SKAction.wait(forDuration: 2.0),SKAction.fadeOut(withDuration: 0.5),SKAction.run {
      scene.setMoving(speed: self.curSection!.speed)
      }])
    levelLabel.run(fadeOut)
    
    scene.movingNode.addChild(levelLabel)
    
  }
  func startLevel(scene:GameScene){
    print("starting level")
    
    
    //update the speed modifier
    //levels repeat after 10 but the speed increases
    let speedModifier : Int = (levelNum / NUM_OF_DIFF)
    StaticHelper.updateSpeedModifier(levelMod: speedModifier)
    
    let difficulty = levelNum % NUM_OF_DIFF
    level = levelManager.getLevel(difficulty: difficulty)
    
    guard let level = level else{
      print("Error, could not find level")
      return
    }
    isNewLevel = true
    //addLabel(level: level, scene: scene)
    
    sectionNumber = 0
    //distNextSegment = distNextSegment - 600
    
    
    if let section = getSection(){
      setCur(section: section,scene: scene)
      
    }else{
      print("there was a problem loading the first section")
    }
  }
  func nextLevel(scene:GameScene){
    print("next level")
    levelNum += 1
    print("going to level \(levelNum)")
    //TODO find levels based on dificulty
    let difficulty = 2//levelNum % NUM_OF_DIFF
    //level = levelManager.getLevel(difficulty: difficulty)
    startLevel(scene: scene)
    
  }
  func checkShouldChange(scene:GameScene){
    
    
    if checkShouldCreateSegment(movingNode: scene.movingNode){
      
      createSegment(scene: scene)
      
      if checkShouldChangeSection(movingNode: scene.movingNode){
        print("time to change the section")
        if nextSection(scene: scene){
          
        }else{
          nextLevel(scene: scene)
        }
      }
    }
    
    if checkShouldChangeSection(movingNode: scene.movingNode){
      
    }
  }
  
  func checkShouldClear(scene:GameScene){
    
    //check if there are pieces
    if pieceList.count > 0 {
      //only check the first piece
      let piece = pieceList[0]
      
      if piece.position.y + scene.movingNode.position.y < -(scene.frame.height+100)/2 {
        piece.removeFromParent()
        pieceList.remove(at: 0)

      }
    }
  }
}

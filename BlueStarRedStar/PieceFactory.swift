
import Foundation
import SpriteKit


class PieceFactory{
  let levelManager = LevelManager()
  
  var distNextSegment : CGFloat = 0.0
  var distNextSection : CGFloat = 0.0
  var sectionNumber = 0
  var levelNum = 0
  var level : Level?
  var curSection : Section?
  var segments : [Segment]?
  
  init() {
    levelManager.setUp()
    
  }
  
  func startGame(scene:GameScene){
    //get a level
    //set everything to 0
    levelNum = 0
    sectionNumber = 0
    
    level = levelManager.getLevel()
    
    if let section = getSection(){
      setCur(section: section,scene: scene)
    }else{
      print("there was a problem loading the section")
    }
    
  }
  
  func setCur(section:Section,scene:GameScene){
    
    curSection = section
    distNextSection = scene.movingNode.position.y - CGFloat(curSection!.distance)
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
    
    let segment = segments?.randomElement()
    
    if let pieces = segment?.pieces{
      for piece in pieces{
        createPiece(scene: scene, piece: piece)
      }
    }else{
      print("no piece array")
    }
    
    
    //TODO calculate properly with segment
    distNextSegment = scene.movingNode.position.y - 200
  }
  private func createPiece(scene:GameScene,piece:Piece){
  
    //TODO add to a piece list
    switch (piece.type){
    case 0:
       Wall.create(scene: scene, piece: piece)
    case 1:
      Coin.create(scene: scene, piece: piece)
    default:
      Wall.create(scene: scene, piece: piece)
    }
  }
  
  
  
  func getSection()-> Section?{
    return level!.sections.filter("orderID == %@",sectionNumber).first
  }
  func nextSection(scene:GameScene)->Bool{
    //returns true if was sucsessful false if time for next level
    sectionNumber += 1
    if let section = getSection(){
      print("section \(sectionNumber) found")
      setCur(section: section, scene: scene)
      
      return true
    }
    
    print("could not find section \(sectionNumber), should move to next level")
    return false
    
    
  }
  func nextLevel(scene:GameScene){
    
    levelNum += 1
    print("going to level \(levelNum)")
    //TODO find levels based on dificulty
    level = levelManager.getLevel()
    sectionNumber = 0
    
    if let section = getSection(){
      setCur(section: section,scene: scene)
    }else{
      print("there was a problem loading the first section")
    }
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
}

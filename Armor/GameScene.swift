//
//  GameScene.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 29/03/22.
//

import SpriteKit

struct PhysicsCategory {
    static let orbit1: UInt32 = 0x1 << 1
    static let playerName: UInt32 = 0x1 << 2
}

class GameScene: SKScene {
    
    let planet = SKShapeNode(circleOfRadius: 40)
    
    let player = SKShapeNode( circleOfRadius: 10)
    
    let fill = [SKColor.init(red: 1, green: 0.078, blue: 0.765, alpha: 1), SKColor.init(red: 1, green: 0.424, blue: 0.898, alpha: 1),
                SKColor.init(red: 1, green: 0.078, blue: 0.686, alpha: 1), SKColor.init(red: 0.855, green: 0.078, blue: 1, alpha: 1),
                SKColor.init(red: 0.694, green: 0.078, blue: 1, alpha: 1), SKColor.init(red: 0.541, green: 0.078, blue: 1, alpha: 1)]
  
    let border = [SKColor.init(red: 1, green: 0.31, blue: 0.824, alpha: 1), SKColor.init(red: 1, green: 0.576, blue: 0.925, alpha: 1),
                  SKColor.init(red: 1, green: 0.231, blue: 0.737, alpha: 1),SKColor.init(red: 0.878, green: 0.231, blue: 1, alpha: 1),
                  SKColor.init(red: 0.745, green: 0.231, blue: 1, alpha: 1),SKColor.init(red: 0.62, green: 0.231, blue: 1, alpha: 1)]
    
    override func didMove(to view: SKView) {
    backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
            circlePath1()
            circlePath2()
            circlePath3()
            addPlanet()
            addPlayer()
    }
    
    func addPlayer(){
        player.fillColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
        player.strokeColor = .init(red: 0.796, green: 1, blue: 0.486, alpha: 1)
        player.glowWidth = 1
        player.position = CGPoint(x: size.width / 2, y: size.width / 4)
        player.name = "playerName"
        let playerMask = SKPhysicsBody(circleOfRadius: 10)
        playerMask.categoryBitMask = PhysicsCategory.playerName
        playerMask.affectedByGravity = false
        player.physicsBody = playerMask
        addChild(player)
    }
    
    func addPlanet(){
        let score = SKLabelNode(fontNamed: "Menlo")
        score.text = "XX"
        score.fontSize = 30
        score.zPosition = 2
        score.fontColor = SKColor.init(red: 1, green: 0.078, blue: 0.765, alpha: 1)
        score.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 1.43 )
        addChild(score)
        planet.fillColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
        planet.strokeColor = .init(red: 0.796, green: 1, blue: 0.486, alpha: 1)
        planet.glowWidth = 1
        planet.zPosition = 1
        planet.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        addChild(planet)
    
    }
    
//    orbuta più interna
    func circlePath1(){
         let path = UIBezierPath()
         path.move(to: CGPoint(x: 0, y: -95))
         path.addLine(to: CGPoint(x: 0, y: -98))
         path.addArc(withCenter: CGPoint.zero,
                     radius: 98,
                     startAngle: CGFloat(3.0 * .pi/2),
                     endAngle: CGFloat(0),
                     clockwise: true)
         path.addLine(to: CGPoint(x: 95, y: 0))
         path.addArc(withCenter: CGPoint.zero,
                     radius: 95,
                     startAngle: CGFloat(0.0),
                     endAngle: CGFloat(3.0 * .pi/2),
                     clockwise: false)
        let circle = duplicateCircles1(path, clockwise: true)
        circle.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        addChild(circle)
        let rotate = SKAction.rotate(byAngle: 2.0 * CGFloat(1.0 * .pi), duration: 6.0)
        circle.run(SKAction.repeatForever(rotate))
    }
//    orbita centrale
    func circlePath2(){
         let path = UIBezierPath()
         path.move(to: CGPoint(x: 0, y: -115))
         path.addLine(to: CGPoint(x: 0, y: -112))
         path.addArc(withCenter: CGPoint.zero,
                     radius: 112,
                     startAngle: CGFloat(3.0 * .pi/2),
                     endAngle: CGFloat(0),
                     clockwise: true)
         path.addLine(to: CGPoint(x: 115, y: 0))
         path.addArc(withCenter: CGPoint.zero,
                     radius: 115,
                     startAngle: CGFloat(0.0),
                     endAngle: CGFloat(3.0 * .pi/2),
                     clockwise: false)
        let circle = duplicateCircles2(path, clockwise: true)
        circle.position = CGPoint(x: size.width/2, y: size.height / 1.4)
        addChild(circle)
        let rotate = SKAction.rotate(byAngle: -2.0 * CGFloat(1.0 * .pi), duration: 5.0)
        circle.run(SKAction.repeatForever(rotate))
    }
//orbita esterna
    func circlePath3(){
         let path = UIBezierPath()
         path.move(to: CGPoint(x: 0, y: -130))
         path.addLine(to: CGPoint(x: 0, y: -127))
         path.addArc(withCenter: CGPoint.zero,
                     radius: 127,
                     startAngle: CGFloat(3.0 * .pi/2),
                     endAngle: CGFloat(0),
                     clockwise: true)
         path.addLine(to: CGPoint(x: 130, y: 0))
         path.addArc(withCenter: CGPoint.zero,
                     radius: 130,
                     startAngle: CGFloat(0.0),
                     endAngle: CGFloat(3.0 * .pi/2),
                     clockwise: false)
        let circle = duplicateCircle3(path, clockwise: true)
        circle.position = CGPoint(x: size.width/2, y: size.height / 1.4)
        addChild(circle)
        let rotate = SKAction.rotate(byAngle: 2.0 * CGFloat(1.0 * .pi), duration: 4.0)
        circle.run(SKAction.repeatForever(rotate))
    }
    
    func duplicateCircles1(_ path: UIBezierPath, clockwise: Bool) -> SKNode{
        let duplication = SKNode()
        var speculare = CGFloat ( 1.0 * .pi)
        if !clockwise {
            speculare *= -1
        }
        for i in 0...1    {
            let section = SKShapeNode(path: path.cgPath)
//            crea una maschera che ha una fisica che è ugale al path e alla forma del semicerchio
            let sectionMask = SKPhysicsBody(edgeLoopFrom: path.cgPath)
            sectionMask.categoryBitMask = PhysicsCategory.orbit1
            sectionMask.affectedByGravity = false
//           l'ho messo pari ad 1 perchè deve avere una collisione col player
            sectionMask.collisionBitMask = 1
//            messo perchè deve esserci il player che si deve scontrare
            sectionMask.contactTestBitMask = PhysicsCategory.playerName
          
            section.physicsBody = sectionMask
            section.fillColor = fill[i]
            section.strokeColor = border[i]
            section.glowWidth = 1
            section.zRotation = speculare * CGFloat(i);
            section.name = "orbit1"
            duplication.addChild(section)
          }

        
        return duplication
    }
    
    func duplicateCircles2(_ path: UIBezierPath, clockwise: Bool) -> SKNode{
        let duplication = SKNode()
        var speculare = CGFloat ( 1.0 * .pi)
        if !clockwise {
            speculare *= -1
        }
        for i in 2...3  {
            let section = SKShapeNode(path: path.cgPath)
            let sectionMask = SKPhysicsBody(edgeLoopFrom: path.cgPath)
            sectionMask.categoryBitMask = PhysicsCategory.orbit1
            sectionMask.affectedByGravity = false
            sectionMask.collisionBitMask = 1
            sectionMask.contactTestBitMask = PhysicsCategory.playerName
            section.fillColor = fill[i]
            section.strokeColor = border[i]
            section.glowWidth = 1
            section.zRotation = speculare * CGFloat(i);
            section.name = "orbit2"
            duplication.addChild(section)
          }

        
        return duplication
    }
    
    func duplicateCircle3(_ path: UIBezierPath, clockwise: Bool) -> SKNode{
        let duplication = SKNode()
        var specchia = CGFloat ( 3.0 * .pi / 4)
        if !clockwise {
            specchia *= 1
        }
        for i in 4...5 {
            let section = SKShapeNode(path: path.cgPath)
            let sectionMask = SKPhysicsBody(edgeLoopFrom: path.cgPath)
            sectionMask.categoryBitMask = PhysicsCategory.orbit1
            sectionMask.affectedByGravity = false
            sectionMask.collisionBitMask = 1
            sectionMask.contactTestBitMask = PhysicsCategory.playerName
            section.fillColor = fill[i]
            section.strokeColor = border[i]
            section.glowWidth = 1
            section.zRotation = specchia * CGFloat(i);
            section.name = "orbit3"
            duplication.addChild(section)
          }
        
        return duplication
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if(touchedNode.name == "playerName"){
            player.position = CGPoint(x: 100, y: 100)
        }
        
        }
        

    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

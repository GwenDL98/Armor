//
//  GameScene.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 29/03/22.
//

import SpriteKit

struct PhysicsCategory {
    static let orbit1: UInt32 = 0x1 << 1
    static let orbit2: UInt32 = 0x1 << 2
    static let orbit3: UInt32 = 0x1 << 3
    static let playerName: UInt32 = 0x1 << 4
    static let pianeta: UInt32 = 0x1 << 5
    static let rectangle: UInt32 = 0x1 << 6
}


class GameScene: SKScene, SKPhysicsContactDelegate {
   
    var win: Bool = false
    var lose: Bool = false
    
    var livello: Int = 1
    
    let planet = SKShapeNode(circleOfRadius: 40)
    
    let player = SKShapeNode( circleOfRadius: 10)
    
    let score: SKLabelNode
    
    let pink = [ SKColor.init(red: 1, green: 0.078, blue: 0.914, alpha: 1), SKColor.init(red: 1, green: 0.078, blue: 0.686, alpha: 1),
                 SKColor.init(red: 0.855, green: 0.078, blue: 1, alpha: 1), SKColor.init(red: 0.694, green: 0.078, blue: 1, alpha: 1),
                 SKColor.init(red: 0.541, green: 0.078, blue: 1, alpha: 1), SKColor.init(red: 0.463, green: 0.078, blue: 1, alpha: 1),
                 SKColor.init(red: 0.31, green: 0.078, blue: 1, alpha: 1), SKColor.init(red: 0.078, green: 0.078, blue: 1, alpha: 1)]
    
    let border  = [ SKColor.init(red: 1, green: 0.231, blue: 0.929, alpha: 1), SKColor.init(red: 1, green: 0.231, blue: 0.737, alpha: 1),
                    SKColor.init(red: 0.878, green: 0.231, blue: 1, alpha: 1), SKColor.init(red: 0.745, green: 0.231, blue: 1, alpha: 1),
                    SKColor.init(red: 0.62, green: 0.231, blue: 1, alpha: 1), SKColor.init(red: 0.553, green: 0.231, blue: 1, alpha: 1),
                    SKColor.init(red: 0.424, green: 0.231, blue: 1, alpha: 1), SKColor.init(red: 0.231, green: 0.231, blue: 1, alpha: 1)]
    
    override init(size: CGSize){
        score = SKLabelNode(text: String(livello))
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
        
        costruttoreScena()
        
        score.fontName = "Menlo"
        score.fontSize = 30
        score.zPosition = 2
        score.fontColor = SKColor.init(red: 1, green: 0.078, blue: 0.765, alpha: 1)
        score.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 1.43 )
        
        self.scene?.physicsWorld.contactDelegate = self
    }
    
    func addPlayer(){
        player.fillColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
        player.strokeColor = .init(red: 0.796, green: 1, blue: 0.486, alpha: 1)
        player.glowWidth = 1
        player.position = CGPoint(x: size.width / 2, y: size.width / 4)
        player.name = "playerName"
        let playerMask = SKPhysicsBody(circleOfRadius: 10)
        playerMask.categoryBitMask = PhysicsCategory.playerName
        playerMask.contactTestBitMask = PhysicsCategory.pianeta
        playerMask.affectedByGravity = false
        player.physicsBody = playerMask
        addChild(player)
    }
    
    func addPlanet(){
        planet.fillColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
        planet.strokeColor = .init(red: 0.796, green: 1, blue: 0.486, alpha: 1)
        planet.glowWidth = 1
        planet.zPosition = 1
        planet.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        planet.name = "pianeta"
        planet.physicsBody = SKPhysicsBody (circleOfRadius: 40)
        planet.physicsBody?.affectedByGravity = false
        planet.physicsBody?.categoryBitMask = PhysicsCategory.pianeta
        planet.physicsBody?.contactTestBitMask = PhysicsCategory.playerName
        planet.physicsBody?.isDynamic = false
        addChild(planet)
        let planetAnimation = SKAction.rotate(byAngle: 2, duration: 5)
        planet.run(SKAction.repeatForever(planetAnimation))
    }
    
    func createBorder(){
        let borderdx = SKShapeNode(rectOf: CGSize(width: 2, height: frame.size.height))
        addChild(borderdx)
        borderdx.position = CGPoint(x: frame.size.width, y: frame.size.height/2)
        borderdx.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 2, height: frame.size.height))
        borderdx.physicsBody?.affectedByGravity = false
        borderdx.physicsBody?.isDynamic = false
        borderdx.physicsBody?.restitution = 0
        borderdx.alpha = 0.001
        let bordersx = SKShapeNode(rectOf: CGSize(width: 2, height: frame.size.height * 2))
        let speculare = CGFloat ( 1.0 * .pi)
        bordersx.zRotation = speculare * CGFloat(1)
        bordersx.alpha = 0.001
        addChild(bordersx)
        let borderTop = SKShapeNode(rectOf: CGSize(width: frame.size.width, height: 2))
        borderTop.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/1.1)
        borderTop.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.size.width, height: 2))
        borderTop.physicsBody?.affectedByGravity = false
        borderTop.physicsBody?.isDynamic = false
        borderTop.physicsBody?.restitution = 0
        borderTop.alpha = 0.001
        addChild(borderTop)
        let borderDown = SKShapeNode(rectOf: CGSize(width: frame.size.width, height: 2))
        borderDown.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/10)
        borderDown.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.size.width, height: 2))
        borderDown.physicsBody?.affectedByGravity = false
        borderDown.physicsBody?.isDynamic = false
        borderDown.physicsBody?.restitution = 0
        borderDown.alpha = 0.001
        addChild(borderDown)
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
        let circle = duplicateCircles1(path, clockwise: false)
        circle.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        addChild(circle)
        let rotate = SKAction.rotate(byAngle: 2.0 * CGFloat(1.0 * .pi), duration: 6.0)
        circle.run(SKAction.repeatForever(rotate))
    }
//    orbita centrale
            func circlePath2(){
                 let path = UIBezierPath()
                 path.move(to: CGPoint(x: 0

        , y: -112))
                 path.addLine(to: CGPoint(x: 0, y: -115))
                 path.addArc(withCenter: CGPoint.zero,
                             radius: 115,
                             startAngle: CGFloat(3.0 * .pi/2),
                             endAngle: CGFloat(0),
                             clockwise: true)
                 path.addLine(to: CGPoint(x: 112, y: 0))
                 path.addArc(withCenter: CGPoint.zero,
                             radius: 112,
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
                 path.move(to: CGPoint(x: 0, y: -127))
                 path.addLine(to: CGPoint(x: 0, y: -130))
                 path.addArc(withCenter: CGPoint.zero,
                             radius: 130,
                             startAngle: CGFloat(3.0 * .pi/2),
                             endAngle: CGFloat(0),
                             clockwise: true)
                 path.addLine(to: CGPoint(x: 127, y: 0))
                 path.addArc(withCenter: CGPoint.zero,
                             radius: 127,
                             startAngle: CGFloat(0.0),
                             endAngle: CGFloat(3.0 * .pi/2),
                             clockwise: false)
                let circle = duplicateCircle3(path, clockwise: true)
                circle.position = CGPoint(x: size.width/2, y: size.height / 1.4)
                addChild(circle)
                let rotate = SKAction.rotate(byAngle: 2.0 * CGFloat(1.0 * .pi), duration: 4.0)
                circle.run(SKAction.repeatForever(rotate))
            }
            
        func circlePath4(){
             let path = UIBezierPath()
             path.move(to: CGPoint(x: 0, y: -142))
             path.addLine(to: CGPoint(x: 0, y: -145))
             path.addArc(withCenter: CGPoint.zero,
                         radius: 145,
                         startAngle: CGFloat(3.0 * .pi/2),
                         endAngle: CGFloat(0),
                         clockwise: true)
             path.addLine(to: CGPoint(x: 142, y: 0))
             path.addArc(withCenter: CGPoint.zero,
                         radius: 142,
                         startAngle: CGFloat(0.0),
                         endAngle: CGFloat(3.0 * .pi/2),
                         clockwise: false)
            let circle = duplicateCircle4(path, clockwise: true)
            circle.position = CGPoint(x: size.width/2, y: size.height / 1.4)
            addChild(circle)
            let rotate = SKAction.rotate(byAngle: -2.0 * CGFloat(1.0 * .pi), duration: 3.0)
            circle.run(SKAction.repeatForever(rotate))
        }
            
            func circlePath5(){
                 let path = UIBezierPath()
                 path.move(to: CGPoint(x: 0, y: -155))
                 path.addLine(to: CGPoint(x: 0, y: -158))
                 path.addArc(withCenter: CGPoint.zero,
                             radius: 158,
                             startAngle: CGFloat(3.0 * .pi/2),
                             endAngle: CGFloat(0),
                             clockwise: true)
                 path.addLine(to: CGPoint(x: 155, y: 0))
                 path.addArc(withCenter: CGPoint.zero,
                             radius: 155,
                             startAngle: CGFloat(0.0),
                             endAngle: CGFloat(3.0 * .pi/2),
                             clockwise: false)
                let circle = duplicateCircle5(path, clockwise: true)
                circle.position = CGPoint(x: size.width/2, y: size.height / 1.4)
                addChild(circle)
                let rotate = SKAction.rotate(byAngle: 2.0 * CGFloat(1.0 * .pi), duration: 7.0)
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
        //            sectionMask.collisionBitMask = 1
        //            messo perchè deve esserci il player che si deve scontrare
                    sectionMask.contactTestBitMask = PhysicsCategory.playerName
                  
                    section.physicsBody = sectionMask
                    section.fillColor = pink[i]
                    section.strokeColor = border[i]
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
                sectionMask.categoryBitMask = PhysicsCategory.orbit2
                sectionMask.affectedByGravity = false
    //            sectionMask.collisionBitMask = 1
                sectionMask.contactTestBitMask = PhysicsCategory.playerName
                section.physicsBody = sectionMask
                section.fillColor = pink[i]
                section.strokeColor = border[i]
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
                sectionMask.categoryBitMask = PhysicsCategory.orbit3
                sectionMask.affectedByGravity = false
    //            sectionMask.collisionBitMask = 1
                sectionMask.contactTestBitMask = PhysicsCategory.playerName
                section.physicsBody = sectionMask
                section.fillColor = pink[i]
                section.strokeColor = pink[i]
                section.zRotation = specchia * CGFloat(i);
                section.name = "orbit3"
                duplication.addChild(section)
              }
            
            return duplication
            
        }
        
    
            func duplicateCircle4(_ path: UIBezierPath, clockwise: Bool) -> SKNode{
            let duplication = SKNode()
            var specchia = CGFloat ( 1.0 * .pi )
                if !clockwise {
                specchia *= 1
            }
            for i in 5...6 {
                let section = SKShapeNode(path: path.cgPath)
                let sectionMask = SKPhysicsBody(edgeLoopFrom: path.cgPath)
                sectionMask.categoryBitMask = PhysicsCategory.orbit3
                sectionMask.affectedByGravity = false
        //            sectionMask.collisionBitMask = 1
                sectionMask.contactTestBitMask = PhysicsCategory.playerName
                section.physicsBody = sectionMask
                section.fillColor = pink[i]
                section.strokeColor = pink[i]
                section.zRotation = specchia * CGFloat(i);
                section.name = "orbit3"
                duplication.addChild(section)
              }
            
            return duplication
            
        }
           
    
            func duplicateCircle5(_ path: UIBezierPath, clockwise: Bool) -> SKNode{
            let duplication = SKNode()
            var specchia = CGFloat ( 1.0 * .pi)
                if !clockwise {
                specchia *= 1
            }
            for i in 6...7 {
                let section = SKShapeNode(path: path.cgPath)
                let sectionMask = SKPhysicsBody(edgeLoopFrom: path.cgPath)
                sectionMask.categoryBitMask = PhysicsCategory.orbit3
                sectionMask.affectedByGravity = false
        //            sectionMask.collisionBitMask = 1
                sectionMask.contactTestBitMask = PhysicsCategory.playerName
                section.physicsBody = sectionMask
                section.fillColor = pink[i]
                section.strokeColor = pink[i]
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
                player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 80))
                player.physicsBody?.linearDamping = 5
            }
            
            }
            

        func didBegin(_ contact: SKPhysicsContact){
            let contactA = contact.bodyA.node?.name
            let contactB = contact.bodyB.node?.name
            
            print("DidBegin")
            
            
            guard contactA != nil else {
                return
            }
            
            guard contactB != nil else{
                return
            }
            
            if (contactA == "playerName" || contactB == "playerName"){
                if(contactA!.contains("orbit") || contactB!.contains("orbit") ){

                    print("hai perso")
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                        self.removeAllChildren()
                        self.livello = 1
                        self.costruttoreScena()
                    })
                }
            }
            
            if (contactA == "playerName" || contactB == "playerName"){
                if(contactA == "pianeta" || contactB == "pianeta"){
                    
                    print("hai vinto")
                    player.removeFromParent()
                    let PlanetAnimationIn = SKAction.fadeOut(withDuration: 0.05)
                    let PlanetAnimationOut = SKAction.fadeIn(withDuration: 0.05)
                    let loop = SKAction.sequence([PlanetAnimationIn, PlanetAnimationOut])
                    planet.run(loop)
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                        self.removeAllChildren()
                        self.livello += 1
                        self.costruttoreScena()
                    })
                }
            }
        }
        
        
        func costruttoreScena(){
            switch livello {
            case 1:
                circlePath1()
                addPlanet()
                addPlayer()
                createBorder()
                score.text = String(livello)
                addChild(score)

            case 2:
                circlePath1()
                circlePath2()
                addPlanet()
                addPlayer()
                createBorder()
                score.text = String(livello)
                addChild(score)
                
            case 3:
                circlePath1()
                circlePath2()
                circlePath3()
                addPlanet()
                addPlayer()
                createBorder()
                score.text = String(livello)
                addChild(score)
                
            case 4:
                circlePath1()
                circlePath2()
                circlePath3()
                addPlanet()
                addPlayer()
                createBorder()
                circlePath4()
                score.text = String(livello)
                addChild(score)
                
            case 5:
                circlePath1()
                circlePath2()
                circlePath3()
                addPlanet()
                addPlayer()
                createBorder()
                circlePath4()
                circlePath5()
                score.text = String(livello)
                addChild(score)

            default : return
                
                }
        }
        
        
        
        
        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
        }
    }

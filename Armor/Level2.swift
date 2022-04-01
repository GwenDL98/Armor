//
//  GameScene2.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 31/03/22.
//

import Foundation
import SpriteKit

struct PhysicsCategory2 {
    static let orbit4: UInt32 = 0x1 << 1
    static let orbit5: UInt32 = 0x1 << 2
    static let orbit6: UInt32 = 0x1 << 3
    static let playerName: UInt32 = 0x1 << 4
    static let pianeta: UInt32 = 0x1 << 5
}


class Livello2 : SKScene, SKPhysicsContactDelegate{

    var originalPlayerPosition: CGPoint!
    let planet = SKShapeNode(circleOfRadius: 40)
    let player2 = SKShapeNode( circleOfRadius: 10)
    let riferimento = SKShapeNode(circleOfRadius: 5)
    
    override func didMove(to view: SKView) {
        
      
    
        backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
//        createBorder()
        createBorderMoving()
        createCircle6()
        addPlanet()
        addPlayer()
//        circlePlayer()
        createCircle7()
        createCircle8()
        originalPlayerPosition = player2.position
        riferimento.position = CGPoint(x: originalPlayerPosition.x, y: originalPlayerPosition.y)
                addChild(riferimento)

    }
    func addPlayer(){
        player2.fillColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
        player2.strokeColor = .init(red: 0.796, green: 1, blue: 0.486, alpha: 1)
        player2.glowWidth = 1
        player2.position = CGPoint(x: size.width / 2, y: size.width / 3)
        player2.name = "playerName"
        let playerMask2 = SKPhysicsBody(circleOfRadius: 10)
        playerMask2.categoryBitMask = PhysicsCategory.playerName
        playerMask2.contactTestBitMask = PhysicsCategory.pianeta
        playerMask2.affectedByGravity = false
        player2.physicsBody = playerMask2
        addChild(player2)
    }
    func circlePlayer(){
 
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: -95))
        path.addLine(to: CGPoint(x: 0, y: -95))
        path.addArc(withCenter: CGPoint.zero,
                    radius: 95,
                    startAngle: CGFloat(3.0 * .pi/2),
                    endAngle: CGFloat(0),
                    clockwise: true)
        path.addLine(to: CGPoint(x: 95, y: 0))
        path.addArc(withCenter: CGPoint.zero,
                    radius: 95,
                    startAngle: CGFloat(0.0),
                    endAngle: CGFloat(3.0 * .pi/2),
                    clockwise: false)
        let circle = SKShapeNode(path: path.cgPath)
        let circle6 = SKShapeNode(path: path.cgPath)
        circle6.xScale = -1
        circle.position = CGPoint(x: frame.size.width/2, y: frame.size.height/6)
        circle.fillColor = .white
        circle.strokeColor = .white
        circle.alpha = 0.01
        circle6.position = CGPoint(x: frame.size.width/2, y: frame.size.height/6)
        circle6.fillColor = .white
        circle6.strokeColor = .white
        circle6.alpha = 0.01
        addChild(circle)
        addChild(circle6)
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
    
    func createCircle6(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: -98))
        path.addLine(to: CGPoint(x: 0, y: -95))
        path.addArc(withCenter: CGPoint.zero,
                    radius: 95,
                    startAngle: CGFloat(3.0 * .pi/2),
                    endAngle: CGFloat(0),
                    clockwise: true)
        path.addLine(to: CGPoint(x: 98, y: 0))
        path.addArc(withCenter: CGPoint.zero,
                    radius: 98,
                    startAngle: CGFloat(0.0),
                    endAngle: CGFloat(3.0 * .pi/2),
                    clockwise: false)
        let circle = SKShapeNode(path: path.cgPath)
        let circle6 = SKShapeNode(path: path.cgPath)
        circle6.xScale = -1
        circle.position = CGPoint(x: frame.size.width/2, y: frame.size.height/1.4)
        circle.fillColor = SKColor.init(red: 1, green: 0.078, blue: 0.914, alpha: 1)
        circle.strokeColor = SKColor.init(red: 1, green: 0.231, blue: 0.929, alpha: 1)
        circle6.position = CGPoint(x: frame.size.width/2, y: frame.size.height/1.4)
        circle6.fillColor = SKColor.init(red: 1, green: 0.078, blue: 0.914, alpha: 1)
        circle6.strokeColor = SKColor.init(red: 1, green: 0.231, blue: 0.929, alpha: 1)
        addChild(circle)
        addChild(circle6)
    }
    
    func createCircle7(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: -112))
        path.addLine(to: CGPoint(x: 0, y: -115))
        path.addArc(withCenter: CGPoint.zero,
                    radius: 115,
                    startAngle: CGFloat(3.0 * .pi/2),
                    endAngle: CGFloat(0.0),
                    clockwise: true)
        path.addLine(to: CGPoint(x: 112, y: 0))
        path.addArc(withCenter: CGPoint.zero,
                    radius: 112,
                    startAngle: CGFloat(0.0),
                    endAngle: CGFloat(3.0 * .pi/2),
                    clockwise: false)
        let circle = SKShapeNode(path: path.cgPath)
        circle.zRotation = -3.0 * .pi/2
        circle.position = CGPoint(x: frame.size.width/2, y: frame.size.height/1.4)
        circle.fillColor = SKColor.init(red: 0.855, green: 0.078, blue: 1, alpha: 1)
        circle.strokeColor = SKColor.init(red: 0.878, green: 0.231, blue: 1, alpha: 1)
        addChild(circle)
    }
    
    func createCircle8(){
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
        let circle = SKShapeNode(path: path.cgPath)
        circle.position = CGPoint(x: size.width/2, y: size.height / 1.4)
        circle.position = CGPoint(x: frame.size.width/2, y: frame.size.height/1.4)
        circle.fillColor = SKColor.init(red: 0.541, green: 0.078, blue: 1, alpha: 1)
        circle.strokeColor = SKColor.init(red: 0.62, green: 0.231, blue: 1, alpha: 1)
        addChild(circle)
        let rotate = SKAction.rotate(byAngle: -2.0 * CGFloat(1.0 * .pi), duration: 6.0)
        circle.run(SKAction.repeatForever(rotate))
    }
    
    func createBorderMoving(){
        let path = UIBezierPath(rect: CGRect(origin: CGPoint(x: frame.size.width * 0.009, y: frame.size.height/5.4), size: CGSize(width: 1, height: frame.size.height/2)))
        let bordersx = SKShapeNode(path: path.cgPath)
        bordersx.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        bordersx.glowWidth = 1
        bordersx.fillColor  = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        bordersx.physicsBody = SKPhysicsBody(edgeLoopFrom: path.cgPath)
        bordersx.physicsBody?.affectedByGravity = false
        bordersx.physicsBody?.isDynamic = false
        let moveUp = SKAction.move(to: CGPoint(x: frame.size.width * 0.009, y: frame.size.height/4), duration: 4)
        let moveDown = SKAction.move(to: CGPoint(x: frame.size.width * 0.009, y: -frame.size.height/5), duration: 4)
        let sequence = SKAction.sequence([moveUp, moveDown])
        let loop = SKAction.repeatForever(sequence)
        bordersx.run(loop)
        addChild(bordersx)
        
        let path1 = UIBezierPath(rect: CGRect(origin: CGPoint(x: frame.size.width/1.01, y: frame.size.height/5.4), size: CGSize(width: 1, height: frame.size.height/2)))
        let borderdx = SKShapeNode(path: path1.cgPath)
        borderdx.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        borderdx.glowWidth = 1
        borderdx.fillColor = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        borderdx.physicsBody = SKPhysicsBody(edgeLoopFrom: path1.cgPath)
        borderdx.physicsBody?.affectedByGravity = false
        borderdx.physicsBody?.isDynamic = false
        borderdx.run(loop)
        addChild(borderdx)
    }
    
    func createBorder(){
        let path = UIBezierPath(rect: CGRect(origin: CGPoint(x: frame.size.width * 0.009, y: frame.size.height/5.4), size: CGSize(width: 1, height: frame.size.height/1.3)))
        let bordersx = SKShapeNode(path: path.cgPath)
        bordersx.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        bordersx.glowWidth = 1
        bordersx.fillColor  = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        bordersx.physicsBody = SKPhysicsBody(edgeLoopFrom: path.cgPath)
        bordersx.physicsBody?.affectedByGravity = false
        bordersx.physicsBody?.isDynamic = false
        addChild(bordersx)
        
        let path1 = UIBezierPath(rect: CGRect(origin: CGPoint(x: frame.size.width/1.01, y: frame.size.height/5.4), size: CGSize(width: 1, height: frame.size.height/1.3)))
        let borderdx = SKShapeNode(path: path1.cgPath)
        borderdx.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        borderdx.glowWidth = 1
        borderdx.fillColor = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        borderdx.physicsBody = SKPhysicsBody(edgeLoopFrom: path1.cgPath)
        borderdx.physicsBody?.affectedByGravity = false
        borderdx.physicsBody?.isDynamic = false
        addChild(borderdx)
       
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: 0))
        path2.addLine(to: CGPoint(x: frame.size.width/7, y: frame.size.height/12))
        let lineasx = SKShapeNode(path: path2.cgPath)
        lineasx.lineWidth = 2
        lineasx.position = CGPoint(x: -frame.size.width*0.0895 , y: frame.size.height/5.99)
        lineasx.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        lineasx.fillColor = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        lineasx.physicsBody = SKPhysicsBody(edgeLoopFrom: path2.cgPath)
        lineasx.physicsBody?.affectedByGravity = false
        lineasx.physicsBody?.isDynamic = false
//        addChild(lineasx)
        
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: 0 , y: 0))
        path3.addLine(to: CGPoint(x:frame.size.width/7, y: frame.size.height/12))
        let lineadx = SKShapeNode(path: path3.cgPath)
        lineadx.lineWidth = 2
        lineadx.position = CGPoint(x: frame.size.width * 1.09 , y: frame.size.height/5.99)
        lineadx.xScale = -1
        lineadx.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        lineadx.fillColor = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        lineadx.physicsBody = SKPhysicsBody(edgeLoopFrom: path3.cgPath)
        lineadx.physicsBody?.affectedByGravity = false
        lineadx.physicsBody?.isDynamic = false
//        addChild(lineadx)
        
        let path4 = UIBezierPath(rect: CGRect(origin: CGPoint(x: frame.size.width * 0.009, y: frame.size.height/1.049), size: CGSize(width: frame.size.width/1.02, height: 1)))
        let borderTop = SKShapeNode(path: path4.cgPath)
        borderTop.fillColor = .init(red: 0.231, green: 1, blue: 0.486, alpha: 1)
        borderTop.glowWidth = 1
        borderTop.strokeColor = .init(red: 0.078, green: 0.812, blue: 1, alpha: 1)
        borderTop.physicsBody = SKPhysicsBody(edgeLoopFrom: path4.cgPath)
        borderTop.physicsBody?.affectedByGravity = false
        borderTop.physicsBody?.isDynamic = false
        addChild(borderTop)
    }
    

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            for touch in touches {
               
              
                let location = touch.location(in: self)
                
        

                if(location.y > 60 && location.y < 150 ){
                    if(location.x > 100 && location.x < 330){
                    
                player2.position.x = location.x
                player2.position.y = location.y
                        print(location.y)
                        circlePlayer()
                    }
                }
                
                let traiettoria = SKShapeNode(rectOf: CGSize(width: 2.5, height: 2.5))
                traiettoria.position = CGPoint(x: player2.position.x, y: player2.position.y)
                traiettoria.zPosition = 10
                addChild(traiettoria)
                traiettoria.run(SKAction.moveBy(x: originalPlayerPosition.x - player2.position.x, y: originalPlayerPosition.y - player2.position.y, duration: 0.1),  completion: {
                    traiettoria.removeFromParent()
        
        })
                
            }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            var deltaX = originalPlayerPosition.x - player2.position.x
            var deltaY = originalPlayerPosition.y - player2.position.y
            
            player2.physicsBody?.applyImpulse(CGVector(dx: deltaX, dy: deltaY))
        }
    
    
}

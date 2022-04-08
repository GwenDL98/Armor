//
//  play.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 07/04/22.
//

import SpriteKit

class play: SKScene {
    
    let TapToPlay = SKLabelNode(text: "Tap to play")
    let armor = SKLabelNode(text: "Armor")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
        let tapToContinue = SKShapeNode(rectOf: CGSize(width: size.width, height: size.height))
        tapToContinue.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height/2)
        tapToContinue.fillColor = .white
        tapToContinue.alpha = 0.001
        tapToContinue.name = "tap"
        tapToContinue.zPosition = 12
        addChild(tapToContinue)
        
        Tapplay()
        Armor()
        circlePath1()
        circlePath2()
        circlePath3()
}
    
    func Tapplay(){
        TapToPlay.fontName = "Menlo"
        TapToPlay.fontSize = frame.size.height * 0.02
        TapToPlay.zPosition = 10
        TapToPlay.fontColor = SKColor.init(red: 1, green: 0.078, blue: 0.765, alpha: 1)
        TapToPlay.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 7 )
        TapToPlay.alpha = 0.01
        let animation = SKAction.wait(forDuration: 1)
        let animation1 = SKAction.fadeIn(withDuration: 0.5)
        let animation2 = SKAction.fadeOut(withDuration: 0.5)
        let sequence = SKAction.sequence([animation, animation1, animation, animation2])
        let loop = SKAction.repeatForever(sequence)
        TapToPlay.run(loop)
        addChild(TapToPlay)
        }
    
    func Armor(){
        armor.fontName = "Menlo"
        armor.fontSize = frame.size.height * 0.05
        armor.zPosition = 10
        armor.fontColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
        armor.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 1.43 )
        addChild(armor)
        }
    
    func circlePath1(){
        let circle = SKShapeNode(circleOfRadius: frame.size.height/8)
        circle.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        circle.lineWidth = frame.size.width * 0.006
        circle.strokeColor = SKColor.init(red: 1, green: 0.078, blue: 0.914, alpha: 1)
        let animation = SKAction.scale(to: 0.9, duration: 0.5)
        circle.run(animation)
        addChild(circle)
    }
    
    
    func circlePath2(){
        let circle = SKShapeNode(circleOfRadius: frame.size.height/5.9)
        circle.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        circle.lineWidth = frame.size.width * 0.006
        circle.strokeColor = SKColor.init(red: 0.855, green: 0.078, blue: 1, alpha: 1)
        let wait = SKAction.wait(forDuration: 0.5)
        let animation = SKAction.scale(to: 0.9, duration: 0.5)
        let sequence = SKAction.sequence([wait, animation])
        circle.run(sequence)
        addChild(circle)
    }
    
    func circlePath3(){
        let circle = SKShapeNode(circleOfRadius: frame.size.height/4.7)
        circle.position = CGPoint(x: size.width / 2, y: size.height / 1.4)
        circle.lineWidth = frame.size.width * 0.006
        circle.strokeColor = SKColor.init(red: 0.541, green: 0.078, blue: 1, alpha: 1)
        let wait = SKAction.wait(forDuration: 1)
        let animation = SKAction.scale(to: 0.9, duration: 0.5)
        let sequence = SKAction.sequence([wait, animation])
        circle.run(sequence)
        addChild(circle)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
//
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if(touchedNode.name == "tap"){
            
            let startGameScene = GameScene(size: self.size)
            let transition = SKTransition.fade(withDuration: 1)
            self.view?.presentScene(startGameScene, transition: transition)
        }
}
}

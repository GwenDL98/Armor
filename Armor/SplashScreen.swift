//
//  SplashScreen.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 07/04/22.
//
import UIKit
import SpriteKit
import SwiftUI

class SplashScreen: SKScene {
    
    let teamLogo: SKSpriteNode = SKSpriteNode(imageNamed: "1.1")
    let teamName  = SKLabelNode(text: "The Axolotl Team")

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
        teamLogo.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        teamLogo.zPosition = 2
        teamLogo.alpha = 0
        addChild(teamLogo)
        
        teamName.fontName = "Menlo"
        teamName.fontSize = frame.size.height * 0.023
        teamName.zPosition = 10
        teamName.fontColor = .init(red: 0.796, green: 0.624, blue: 0.804, alpha: 1)
        teamName.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 3.0 )
        addChild(teamName)
        
        teamLogo.run(SKAction.repeatForever(SKAction.animate(with: [SKTexture(imageNamed: "1.1") , SKTexture(imageNamed:"2.1")], timePerFrame: 0.35)))
        
        teamLogo.run(SKAction.fadeIn(withDuration: 0.05), completion: {
            DispatchQueue.main.asyncAfter(deadline: .now()+2.5, execute: {
                self.teamLogo.run(SKAction.fadeOut(withDuration: 0.5))
                self.teamName.run(SKAction.fadeOut(withDuration: 0.5), completion: {
                    self.teamName.removeFromParent()
                    let startGameScene = play(size: self.size)
                    let transition = SKTransition.fade(withDuration: 1)
                    self.view?.presentScene(startGameScene, transition: transition)
//                    self.view?.presentScene(GameScene(size: self.size))
                })
            })
        })
        
        
    }
    
    
    
    
    
}


//class SplashScreen: SKScene {
// let Axolotl = SKLabelNode(text: "The Axolotl")
//
//    override func didMove(to view: SKView) {
//        Axolotl.fontName = "Minecraft"
//        Axolotl.fontSize = frame.size.height * 0.05
//        Axolotl.zPosition = 10
//        Axolotl.fontColor = .init(red: 0.678, green: 1, blue: 0.184, alpha: 1)
//        Axolotl.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 1.43 )
//        addChild(Axolotl)
//    }
//}

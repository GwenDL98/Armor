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
    
    let teamLogo: SKSpriteNode = SKSpriteNode(imageNamed: "TeamLogo")
    let blackBackground: SKShapeNode
    
    override init(size: CGSize) {
        blackBackground = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))

        super.init(size: size)
    }
        required init(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func didMove(to view: SKView) {
        blackBackground.strokeColor = .black
        blackBackground.fillColor = .black
        blackBackground.zPosition = 1
        blackBackground.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        
        teamLogo.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        teamLogo.zPosition = 2
        teamLogo.alpha = 0
        
        addChild(blackBackground)
        addChild(teamLogo)
        
//        teamLogo.run(SKAction.fadeIn(withDuration: 0.7))
        
        teamLogo.run(SKAction.fadeIn(withDuration: 0.7), completion: {
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
                self.teamLogo.run(SKAction.fadeOut(withDuration: 0.5), completion: {
                    self.teamLogo.removeFromParent()
    //                let menuScene = GameScene(size: self.size)
    //                self.view?.presentScene(menuScene)
                    self.view?.presentScene(GameScene(size: self.size))
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

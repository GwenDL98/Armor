//
//  Level3.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 01/04/22.
//
import Foundation
import SpriteKit

class Level3: SKScene {
    
    let winLabel = SKLabelNode(text: "You Win!")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
        winLabel.fontName = "Menlo"
        winLabel.fontSize = 30
        winLabel.zPosition = 10
        winLabel.fontColor = SKColor.init(red: 1, green: 0.078, blue: 0.765, alpha: 1)
        winLabel.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 1.43 )
        addChild(winLabel)
    }

}

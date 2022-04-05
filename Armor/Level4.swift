//
//  Level4.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 02/04/22.
//

import Foundation
import SpriteKit

class Level4 : SKScene{
    
     
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.init(red: 0.078, green: 0, blue: 0.184, alpha: 1)
        curva1()
    }
    
    func curva1(){
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: -98))
        path1.addLine(to: CGPoint(x: 0, y: -95))
        path1.addArc(withCenter: CGPoint.zero,
                    radius: 95,
                    startAngle: CGFloat(3.0 * .pi/2),
                    endAngle: CGFloat(0),
                    clockwise: true)
        path1.addLine(to: CGPoint(x: 98, y: 0))
        path1.addArc(withCenter: CGPoint.zero,
                    radius: 98,
                    startAngle: CGFloat(0.0),
                    endAngle: CGFloat(3.0 * .pi/2),
                    clockwise: false)
        let nodo = SKShapeNode(path: path1.cgPath, centered: true)
        nodo.position = CGPoint(x: frame.size.width/2, y: frame.size.height/1.4)
        addChild(nodo)
    }
}

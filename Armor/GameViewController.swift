//
//  GameViewController.swift
//  Armor
//
//  Created by Guendalina De Laurentis on 29/03/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let scene = play(size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
//        let scene = Livello2(size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
//        let scene = Level3(size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        let scene = Level4(size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))

        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        skView.showsPhysics = false

    }
}

//
//  GameScene.swift
//  P11-Pachinko
//
//  Created by Stefano Pernat on 07/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
            box.position = location
            addChild(box)
        }
    }
}

//
//  WhackSlot.swift
//  P14-Whack-a-penguin
//
//  Created by Stefano Pernat on 16/05/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit
import SpriteKit

class WhackSlot: SKNode {
    func configure(at position: CGPoint) {
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
    }
}

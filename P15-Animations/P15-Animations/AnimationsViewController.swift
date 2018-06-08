//
//  ViewController.swift
//  P15-Animations
//
//  Created by Stefano Pernat on 08/06/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {

    // MARK: - Properties
    var imageView: UIImageView!
    var currentAnimation = 0
    
    // MARK: - Outlets
    @IBOutlet weak var tap: UIButton!
    
    // MARK: - ViewController callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 184)
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func tapped(_ sender: UIButton) {
        tap.isHidden = true
        
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [],
            animations: { [unowned self] in
            switch self.currentAnimation {
            case 0:
                break
            default:
                break
            }
        },
            completion: { [unowned self] (finished: Bool) in
                self.tap.isHidden = false
            })
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}


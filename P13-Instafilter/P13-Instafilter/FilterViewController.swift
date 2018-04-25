//
//  ViewController.swift
//  P13-Instafilter
//
//  Created by Stefano Pernat on 18/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // - MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intensity: UISlider!
    
    var currentImage: UIImage!

    // - MARK: view controller callback functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "YACIFP"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBActions
    @IBAction func changeFilter(sender: UIButton) {
        
    }
    
    @IBAction func save(sender: UIButton) {
        
    }
    
    @IBAction func intensityChanged(_ sender: UISlider) {
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
}


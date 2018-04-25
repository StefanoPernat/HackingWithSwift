//
//  ViewController.swift
//  P13-Instafilter
//
//  Created by Stefano Pernat on 18/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit
import CoreImage

class FilterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // - MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intensity: UISlider!
    
    var currentImage: UIImage!
    
    // - MARK: CoreImage properties
    var context: CIContext!
    var currentFilter: CIFilter!

    // - MARK: view controller callback functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "YACIFP"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: UIImagePickerControllerDelegate callback functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        
        dismiss(animated: true)
        
        currentImage = image
        
        let beginImage = CIImage(image: currentImage)
        
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
    }
    
    // - MARK: IBActions
    @IBAction func changeFilter(sender: UIButton) {
        
    }
    
    @IBAction func save(sender: UIButton) {
        
    }
    
    @IBAction func intensityChanged(_ sender: UISlider) {
    }
    
    // - MARK: Functions
    @objc func importPicture() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
}


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
    @IBOutlet weak var changeFilter: UIButton!
    @IBOutlet weak var radius: UISlider!
    
    
    var currentImage: UIImage!
    
    // - MARK: CoreImage properties
    var context: CIContext!
    var currentFilter: CIFilter! {              // Future edits I: Change Change filter to the name of the current filter
        didSet {
            changeFilter.setTitle(currentFilter.name, for: .normal)
        }
    }

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
        
        applyProcessing()
        radiusProcessing()
    }
    
    // - MARK: IBActions
    @IBAction func changeFilter(sender: UIButton) {
        let chooseFilterAlertController = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        
        chooseFilterAlertController.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        chooseFilterAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        
        present(chooseFilterAlertController, animated: true)
    }
    
    @IBAction func save(sender: UIButton) {
        guard let editedImage = imageView.image else {              // Future edits III: Fix save bug if there's no image selected
            let noImageAlertController = UIAlertController(title: "Error", message: "Select an image before saving.", preferredStyle: .alert)
            noImageAlertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(noImageAlertController, animated: true)

            return
        }
        
        UIImageWriteToSavedPhotosAlbum(
            editedImage,
            self,
            #selector(image(_:didFinishSavingWithError:contextInfo:)),
            nil
        )
    }
    
    @IBAction func intensityChanged(_ sender: UISlider) {
        applyProcessing()
    }
    
    @IBAction func radiusChanged(_ sender: UISlider) {
        radiusProcessing()
    }
    
    // - MARK: Functions
    @objc func importPicture() {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func applyProcessing() {
        guard currentImage != nil else {
            return
        }
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(intensity.value * 10, forKey: kCIInputScaleKey)
        }
        
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(
                CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2),
                forKey: kCIInputCenterKey
            )
        }
        
        if let cgImage = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            
            imageView.image = processedImage
        }
    }
    
    func radiusProcessing() {
        guard currentImage != nil else {
            return
        }
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(radius.value * 200, forKey: kCIInputRadiusKey)
        }
        
        if let cgImage = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            
            imageView.image = processedImage
        }
    }
    
    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else {
            return
        }
        
        currentFilter = CIFilter(name: action.title!)
        
        let beginImage = CIImage(image: currentImage)
        
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let errorAlertController = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(errorAlertController, animated: true)
        } else {
            let saveAlertController = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            saveAlertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(saveAlertController, animated: true)
        }
    }
}


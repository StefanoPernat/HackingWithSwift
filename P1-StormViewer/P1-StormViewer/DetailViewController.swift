//
//  DetailViewController.swift
//  P1-StormViewer
//
//  Created by Stefano Pernat on 25/02/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // - MARK: IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // - MARK: Properties
    var selectedImage: String?
    
    // - MARK: ViewController callbacks
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

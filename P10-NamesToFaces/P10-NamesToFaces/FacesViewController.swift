//
//  ViewController.swift
//  P10-NamesToFaces
//
//  Created by Stefano Pernat on 03/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class FacesViewController: UICollectionViewController {

    // - MARK: ViewController callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: CollectionView callback methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as! PersonCell
        
        return cell
    }
}


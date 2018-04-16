//
//  ViewController.swift
//  P10-NamesToFaces
//
//  Created by Stefano Pernat on 03/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class FacesViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // - MARK: Properties
    var people = [Person]()
    
    // - MARK: ViewController callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // - MARK: CollectionView callback methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as! PersonCell
        
        let person = people[indexPath.item]
        
        let path = getDocumentDirectory().appendingPathComponent(person.image)
        
        cell.name.text = person.name
        cell.picture.image = UIImage(contentsOfFile: path.path)
        
        cell.picture.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        cell.picture.layer.borderWidth = 2
        cell.picture.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let changeNameAlertController = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
        changeNameAlertController.addTextField()
        changeNameAlertController.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self, changeNameAlertController] _ in
            let newName = changeNameAlertController.textFields![0].text!
            
            if newName.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                person.name = newName
            }
            
            self.collectionView?.reloadData()
            self.save()
        })
        changeNameAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(changeNameAlertController, animated: true)
    }
    
    // - MARK: ImagePickerControllerCallbacks
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentDirectory().appendingPathComponent(imageName)
        
        if let jpegData = UIImageJPEGRepresentation(image, 80) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        
        collectionView?.reloadData()
        save()
        
        dismiss(animated: true)
    }
    
    // - MARK: methods
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    fileprivate func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(people) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        } else {
            print("Failed to save people.")
        }
    }
}


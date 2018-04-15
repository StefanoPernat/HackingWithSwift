//
//  Person.swift
//  P10-NamesToFaces
//
//  Created by Stefano Pernat on 05/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    // - MARK: Properties
    var name: String
    var image: String
    
    // - MARK: methods
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    // - MARK: NSCoding methods
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        image = aDecoder.decodeObject(forKey: "image") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
}

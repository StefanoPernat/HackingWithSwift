//
//  Person.swift
//  P10-NamesToFaces
//
//  Created by Stefano Pernat on 05/04/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

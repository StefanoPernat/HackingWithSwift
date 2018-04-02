//
//  Petition.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 18/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//
// This file contain the definition of the Petition Class

import Foundation

class Petition {
    let id: String
    let title: String
    let body: String
    let signatureCount: Int
    let signatureThreshold: Int
    
    init?(fromJSON json: [String: Any]) {
        guard
            let id = json["id"] as? String,
            let title = json["title"] as? String,
            let body = json["body"] as? String,
            let signatureThreshold = json["signatureThreshold"] as? Int,
            let signatureCount = json["signatureCount"] as? Int
        else {
            return nil
        }
        
        self.id = id
        self.title = title
        self.body = body
        self.signatureCount = signatureCount
        self.signatureThreshold = signatureThreshold
    }
}

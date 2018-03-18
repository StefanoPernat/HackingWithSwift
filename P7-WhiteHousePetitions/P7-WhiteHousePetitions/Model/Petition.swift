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
    let id: Int
    let title: String
    let body: String
    let signatureCount: Int
    let signatureThreshold: Int
    
    init?(fromJSON json: [String: String]) {
        guard
            let id = Int(json["id"]!),
            let title = json["title"],
            let body = json["body"],
            let signatureCount = Int(json["signatureCount"]!),
            let signatureThreshold = Int(json["signatureThreshold"]!)
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

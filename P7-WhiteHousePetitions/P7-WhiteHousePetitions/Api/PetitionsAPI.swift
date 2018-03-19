//
//  PetitionsAPI.swift
//  P7-WhiteHousePetitions
//
// This struct will be the base class to fetch and build petitions array from JSON data
//
// 1) Build consistent URL [OK]
// 2) fetch JSON From URL

//  Created by Stefano Pernat on 18/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import Foundation

enum Method {
    case mostRecent
    case mostSigned(signatureThreshold: Int)
}


struct PetitionsAPI {
    // - MARK: Properties
    private static let baseURLString = "https://api.whitehouse.gov/v1/petitions.json"
    
    // - MARK: Methods
    public static func buildURL(forMethod method: Method, limitedTo limit: Int) -> URL {
        // divide url into components
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        // adding the limit
        queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
        
        // set the resultURL
        switch method {
        case .mostRecent:
            components.queryItems = queryItems
        case .mostSigned(let threshold):
            queryItems.append(URLQueryItem(name: "signatureCountFloor", value: String(threshold)))
            components.queryItems = queryItems
        }
        
        return components.url!
    }
}

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
    
    
    private static let baseURLString = "https://api.whitehouse.gov/v1/petitions.json"
    
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
    
    /*public static func fetchMostRecent(limit: Int) -> [Petition]? {
        var petitionsArray: [Petition]? = nil
        let url = buildURL(forMethod: .mostRecent, limitedTo: limit)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            if error == nil {
                print("error is not nil")
                let jsonObject = try! JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonObject)
            }
            
        }
        task.resume()
        return nil
    }
    
    public static func fetchMostSigned(threshold: Int, limit: Int) -> [String]? {
        let url = buildURL(forMethod: .mostSigned(signatureThreshold: threshold), limitedTo: limit)
        
        print(url.absoluteString)
        
        return nil
    }
    
    private static func parseJSON(data: Data) -> [Petition]? {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard
            let jsonDictionary = jsonObject as? [AnyHashable: Any],
            let jsonResult = jsonDictionary["result"] as? [Int: Any]
            else {
                return nil
            }
            
            print(jsonObject)
            return nil
        } catch  {
            return nil
        }
    }*/
    
}

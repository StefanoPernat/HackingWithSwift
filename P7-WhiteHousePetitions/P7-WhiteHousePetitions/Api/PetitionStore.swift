//
//  PetitionStore.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 19/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import Foundation


enum PetitionsResult {
    case success([Petition])
    case failure
}

class PetitionStore {
    // - MARK: Properties
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    var petitions: [Petition]?
    
    // - MARK: Public Methods
    public func fetchMostRecent(limitedTo limit: Int, completition: @escaping (PetitionsResult) -> Void) {
        let url = PetitionsAPI.buildURL(forMethod: .mostRecent, limitedTo: limit)
        fetch(fromURL: url, completition: completition)
    }
    
    // - MARK: Private Methods
    private func fetch(fromURL url: URL, completition: @escaping (PetitionsResult) -> Void) {
        let request = URLRequest(url: url)
        let task = self.session.dataTask(with: request) {
            [unowned self] (data, response, error) in
                print("[FETCH] Started Task....")
                if error == nil {
                    print("[FETCH] No Errors")
                    guard
                        let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: []),
                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
                        let jsonArray = jsonDictionary["results"] as? [[String: Any]]
                    else {
                            print("[FETCH] Error while parsing root json object")
                            completition(.failure)
                            return
                    }
                    
                    completition(.success(self.parse(fromJSON: jsonArray)!))
                    
                    //print(self.petitions?.count)
                }
            }
        task.resume()
    }
    
    private func parse(fromJSON json: [[String: Any]]) -> [Petition]? {
        var petitions = [Petition]()
        
        for jsonPetition in json {
            let p = Petition(fromJSON: jsonPetition)
            if p != nil {
                petitions.append(p!)
            }
        }
        
        return petitions.count == 0 ? nil : petitions
    }
}

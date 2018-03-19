//
//  PetitionStore.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 19/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import Foundation

class PetitionStore {
    // - MARK: Properties
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    var petitions: [Petition]?
    
    // - MARK: Public Methods
    public func fetchMostRecent(limitedTo limit: Int) {
        let url = PetitionsAPI.buildURL(forMethod: .mostRecent, limitedTo: limit)
        fetch(fromURL: url, limitedTo: limit)
    }
    
    // - MARK: Private Methods
    private func fetch(fromURL url: URL, limitedTo limit: Int) {
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            [unowned self] (data, response, error) in
            
            if error == nil {
                guard
                    let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: []),
                    let jsonDictionary = jsonObject as? [AnyHashable: Any],
                    let jsonArray = jsonDictionary["results"] as? [[String: Any]]
                else {
                        self.petitions = nil
                        return
                }
                
                self.petitions = self.parse(fromJSON: jsonArray)
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

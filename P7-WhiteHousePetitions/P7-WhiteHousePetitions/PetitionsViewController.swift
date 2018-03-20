//
//  ViewController.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 17/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class PetitionsViewController: UITableViewController {

    var petitionsStore = PetitionsStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        petitionsStore.fetchMostRecent(limitedTo: 100) {
            [unowned self] (petitionResult) -> Void in
            
            if case .success(let petitions) = petitionResult {
                self.petitionsStore.petitions = petitions
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petitionsStore.petitions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Petition", for: indexPath)
        cell.textLabel?.text = "Petition Title"
        cell.detailTextLabel?.text = "Petition Body"
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


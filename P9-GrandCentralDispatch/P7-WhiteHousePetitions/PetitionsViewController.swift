//
//  ViewController.swift
//  P7-WhiteHousePetitions
//
//  Created by Stefano Pernat on 17/03/18.
//  Copyright © 2018 Stefano Pernat. All rights reserved.
//

import UIKit

class PetitionsViewController: UITableViewController {

    // MARK: - properties
    var petitionsStore = PetitionsStore()
    var sortCriteria: Method = .mostRecent
    
    // MARK: - VC callback methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "White House Petitions"
        
        switch sortCriteria {
        case .mostRecent:
            petitionsStore.fetchMostRecent(limitedTo: 100, completition: fetchingIsOver)
        case .mostSigned(let threshold):
            petitionsStore.fetchMostSigned(signatureThreshold: threshold, limitedTo: 100, completition: fetchingIsOver)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableViewCallback methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petitionsStore.petitions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Petition", for: indexPath)
        
        if let petition = petitionsStore.petitions?[indexPath.row] {
            cell.textLabel?.text = petition.title
            cell.detailTextLabel?.text = petition.body
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let petitionVC = PetitionDetailViewController()
        petitionVC.selectedPetition = petitionsStore.petitions?[indexPath.row]
        navigationController?.pushViewController(petitionVC, animated: true)
    }
    
    // MARK: Private methods
    private func fetchingIsOver(result: PetitionsResult) -> Void {
        DispatchQueue.main.async {
            [unowned self] in
            
            if case .success(let petitions) = result {
                self.petitionsStore.petitions = petitions
                //DispatchQueue.main.async {
                self.tableView.reloadData()
                //}
            } else {
                let errorAlertController = UIAlertController(title: "Error while fetching petitions", message: "There was a problem while fetching Whitehouse petitions", preferredStyle: .alert)
                errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(errorAlertController, animated: true)
            }
        }
    }
}


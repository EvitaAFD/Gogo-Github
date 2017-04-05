//
//  RepoViewController.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/4/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var repoTableView: UITableView!
    
    var repos = [Repository]() {
        didSet {
            self.repoTableView.reloadData()
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoTableView.delegate = self
        self.repoTableView.dataSource = self
        
        self.repoTableView.estimatedRowHeight = 100
        self.repoTableView.rowHeight = UITableViewAutomaticDimension

        update()
    }
    
    func update() {
        print("update repo controller here")
        
        GitHub.shared.getRepos { (repositories) in
            //update table view
            guard let unwrappedRepos = repositories else { return }
            
            OperationQueue.main.addOperation {
                self.repos = unwrappedRepos
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = repoTableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoCell
        
        cell.repoName.text = self.repos[indexPath.row].name
        
        cell.repoDescription.text = self.repos[indexPath.row].description
        
        return cell
    }

}



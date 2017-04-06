//
//  RepoViewController.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/4/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {
    

    @IBOutlet weak var repoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repos = [Repository]() {
        didSet {
            self.repoTableView.reloadData()
        }
    
    }
    
    var displayRepos : [Repository]? {
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
        
        self.searchBar.delegate = self
        
        let repoNibCell = UINib(nibName: RepoNibCell.identifier, bundle: nil)
        self.repoTableView.register(repoNibCell, forCellReuseIdentifier: RepoNibCell.identifier)

        update()
    }
    
    func update() {
        
        GitHub.shared.getRepos { (repositories) in
            guard let unwrappedRepos = repositories else { return }
            
            OperationQueue.main.addOperation {
                self.repos = unwrappedRepos
            }
        }
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == RepoDetailViewController.identifier {
            segue.destination.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
            
            if let selectedRow = self.repoTableView.indexPathForSelectedRow?.row{
                let selectedRepo = self.repos[selectedRow]
            
            guard let destinationController = segue.destination as? RepoDetailViewController else { return }
            
                destinationController.repo = selectedRepo
            }
        }
    }
}


//MARK: UIViewControllerTransitionDelegate
extension RepoViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition(duration: 1.0)
        
    }

}

//MARK:
extension RepoViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = repoTableView.dequeueReusableCell(withIdentifier: RepoNibCell.identifier, for: indexPath) as! RepoNibCell
        
        let repo = self.repos[indexPath.row]
        
        cell.repo = repo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailViewController.identifier, sender: nil)
    }

}

//MARK: UISearchBarDelegate
extension RepoViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let searchedText = searchBar.text {
            self.displayRepos = self.repos.filter({($0.name?.contains(searchedText))!})
        }
        if searchBar.text == "" {
            self.displayRepos = nil
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.displayRepos = nil
        self.searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}



//
//  RepoDetailViewController.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/5/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit
import SafariServices

class RepoDetailViewController: UIViewController {
    
    
    @IBOutlet weak var repoDetailName: UILabel!
    @IBOutlet weak var repoDetailDescription: UILabel!
    @IBOutlet weak var repoDetailLanguage: UILabel!
    @IBOutlet weak var repoDetailStars: UILabel!
    @IBOutlet weak var repoDetailForked: UILabel!
    @IBOutlet weak var repoDetailDateCreated: UILabel!
    
    @IBAction func cancelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    var repo : Repository! 


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoDetailName.text = repo.name
        self.repoDetailDescription.text = repo.description
        self.repoDetailLanguage.text = repo.language
        self.repoDetailStars.text = repo.numberStars
        if repo.forked! {
            self.repoDetailForked.isHidden = false
        } else {
            self.repoDetailForked.isHidden = true
        }
        self.repoDetailDateCreated.text = repo.createdDate
        
    }
    
    @IBAction func moreDetailsPressed(_ sender: Any) {
        guard let repo = repo else { return }
        
        presentSafariViewConttoller(urlString: repo.repoUrlString)
    }
    
    func presentSafariViewConttoller(urlString: String){
        
        guard let url = URL(string: urlString) else { return }
        
        let safariController = SFSafariViewController(url: url)
        
        self.present(safariController, animated: true, completion: nil)
    }

}

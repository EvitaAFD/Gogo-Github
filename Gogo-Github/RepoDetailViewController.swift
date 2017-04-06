//
//  RepoDetailViewController.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/5/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
    
    
    var repo : Repository? {
        didSet {
//            self.repoName.text = repo?.name
//            self.repoDescription.text = repo?.description
//            self.repoLanguage.text = repo?.language
            //            self.isForked.text = repo?.isForked
            //
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

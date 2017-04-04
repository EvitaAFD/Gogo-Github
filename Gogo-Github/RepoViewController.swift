//
//  RepoViewController.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/4/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        update()
    }
    
    func update() {
        print("update repo controller here")
        
        GitHub.shared.getRepos { (repositories) in
            //update table view
        
        }
    }

}



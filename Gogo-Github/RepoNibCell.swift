//
//  RepoNibCell.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/5/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class RepoNibCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    
    var repo : Repository? {
        didSet {
            self.repoName.text = repo?.name
            self.repoDescription.text = repo?.description
            self.repoLanguage.text = repo?.language
//            self.isForked.text = repo?.isForked
//        
        }
    
    }
}

//
//  Repository.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/4/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation


class Repository {

    let name : String
    let description : String?
    let language : String?
    let numberStars : String?
    let createdDate : String?
    let forked : Bool?
    
    let repoUrlString : String
    
    init?(json: [String : Any]) {
        self.name = json["name"] as? String ?? "This repo has no name."
        self.description = json["description"] as? String ?? "No description available."
        self.language = json["language"] as? String ?? "Language not defined."
        self.numberStars = json["stargazers_count"] as? String ?? "No stars on this repo."
        self.createdDate = (json["created_at"] as? String)?.components(separatedBy: "T").first
        self.forked = json["fork"] as? Bool
        
        self.repoUrlString = json["html_url"] as? String ?? "https://www.github.com"
        
    }
}

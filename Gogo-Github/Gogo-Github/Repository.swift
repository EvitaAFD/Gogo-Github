//
//  Repository.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/4/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation


class Repository {

    let name : String?
    let description : String?
    let language : String?
    let numberStars : String?
    let createdDate : String?
    let forked : Bool?
    
    init?(json: [String : Any]) {
        self.name = json["name"] as? String ?? "No name"
        self.description = json["description"] as? String ?? "No description"
        self.language = json["language"] as? String ?? "Undefined language"
        self.numberStars = json["stargazers_count"] as? String ?? "No Stars"
        self.createdDate = (json["created_at"] as? String)?.components(separatedBy: "T").first
        self.forked = json["fork"] as? Bool
        
    }
}

//
//  GitHub.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/3/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

let kOAuthBaseURLString = "https://github.com/login/oauth/"

enum GitHubAuthError : Error {
    case extractingCode
}

class GitHub {

    let gitHubClientID = "46fedd5f05e0fa84bb6f"
    let gitHubClientSecret = "46c6d589b2f108bc19651847027758284ef052f2"
    
    static let shared = GitHub()
    
    func oAuthRequestWith(parameters: [String : String]) {
        var parametersString = ""
        
        for (key, value) in parameters {
            parametersString += "&\(key)=\(value)"
        }
            
        if let requestURL = URL(string: "\(kOAuthBaseURLString)authorize?client_id=\(gitHubClientID)\(parametersString)") {
            
            print(requestURL.absoluteString)
            
            UIApplication.shared.open(requestURL)
    
        
        }
    }
    
    func getCodeFrom(url: URL) throws -> String {
        
        guard let code = url.absoluteString.components(separatedBy: "=").last else {
            throw GitHubAuthError.extractingCode
        }
        
        return code
    }
}
    
        


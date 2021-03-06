//
//  FoundationExtensions.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/3/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import Foundation


//MARK: Extension UserDefaults
extension UserDefaults {
    func getAccessToken() -> String? {
        guard let token = UserDefaults.standard.string(forKey: "access_token") else { return nil }
        return token
    }
    
    func save(accessToken: String) -> Bool {
            UserDefaults.standard.set(accessToken, forKey: "access_token")
            return UserDefaults.standard.synchronize()
    
    }
}












//MARK: Regex Extension
extension String {

    func validate() -> Bool {
        
        let pattern = "[^0-9a-zA-Z_-]"
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            
            let range = NSRange(location: 0, length: self.characters.count)
            let matches = regex.numberOfMatches(in: self, options: .reportCompletion, range: range)
            
            if matches > 0 {
                return false
            }
            
            return true
            
         } catch {
            return false
        }
    }

}

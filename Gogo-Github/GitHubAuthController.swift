//
//  GitHubAuthController.swift
//  Gogo-Github
//
//  Created by Eve Denison on 4/3/17.
//  Copyright © 2017 Eve Denison. All rights reserved.
//

import UIKit

class GitHubAuthController: UIViewController {

    @IBOutlet weak var loginButtonHidden: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (UserDefaults.standard.getAccessToken() != nil) {
            loginButtonHidden.isHidden = true
        }
    }

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let parameters = ["scope" : "email,user,repo"]
        
        GitHub.shared.oAuthRequestWith(parameters: parameters)
        
    }
    
    func dismissAuthController() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        
    
    }

}

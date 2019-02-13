//
//  ViewController.swift
//  TwitterKitSample
//
//  Created by KENJI WADA on 2019/02/13.
//  Copyright © 2019 jp.ch3cooh. All rights reserved.
//

import UIKit
import BrightFutures

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        
        TwitterService.login().andThen { (_) in
            
            }.onSuccess { (session) in
                if let token = session.authToken, let tokenSecret = session.authTokenSecret {
                    print("twitter => authToken:\(token) authTokenSecret: \(tokenSecret)")
                }
            }.onFailure { (error) in
                if error.domain != "TWTRLogInErrorDomain" || error.code != 1 {
                    print("error")
                }
        }
        
    }
}


//
//  TwitterService.swift
//  TwitterKitSample
//
//  Created by KENJI WADA on 2019/02/13.
//  Copyright © 2019 jp.ch3cooh. All rights reserved.
//

import Foundation
import BrightFutures
import TwitterKit

class TwitterService {
    
    class TwitterSession {
        var authToken: String?
        var authTokenSecret: String?
        
        init(token: String?, tokenSecret: String?) {
            self.authToken = token
            self.authTokenSecret = tokenSecret
        }
    }
    
    static func setup(_ consumerKey: String, consumerSecret: String) {
        TWTRTwitter.sharedInstance().start(withConsumerKey: consumerKey, consumerSecret: consumerSecret)
    }
    
    static func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
    
    static func login() -> Future<TwitterSession, NSError> {
        let promise = Promise<TwitterSession, NSError>()
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            if let err = error {
                promise.failure(err as NSError)
            } else if let s = session {
                promise.success(TwitterSession(token: s.authToken, tokenSecret: s.authTokenSecret))
            } else {
                promise.failure(NSError())
            }
        }
        return promise.future
    }
    
}

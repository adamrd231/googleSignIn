//
//  ViewController.swift
//  GLoginExample
//
//  Created by Adam Reed on 11/12/17.
//  Copyright © 2017 rdConcepts. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google


class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var labelMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil {
            print(error ?? "Default error")
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center
        view.addSubview(googleSignInButton)
        
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            print(error ?? "Default Error")
            return
        }
        
        labelMessage.text = user.profile.email
        
    }

}


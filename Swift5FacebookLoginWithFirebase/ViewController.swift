//
//  ViewController.swift
//  Swift5FacebookLoginWithFirebase
//
//  Created by 山本ののか on 2020/04/26.
//  Copyright © 2020 Nonoka Yamamoto. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin
import Firebase

class ViewController: UIViewController, LoginButtonDelegate {
    
    let fbLoginButton: FBLoginButton = FBLoginButton()
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fbLoginButton.delegate = self
        fbLoginButton.frame = CGRect(x: view.frame.width/2 - view.frame.width/4, y: view.frame.height/4, width: view.frame.width/2, height: 30)
        fbLoginButton.permissions = ["public_profile, email"]
        view.addSubview(fbLoginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        if error == nil {
            if result?.isCancelled == true {
                return
            }
        }
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential) { (result, error) in
            if error != nil {
                return
            }
            self.displayName = result!.user.displayName!
            self.pictureURLString = result!.user.photoURL!.absoluteString
            self.pictureURLString = self.pictureURLString + "?type=large"
            UserDefaults.standard.set(1, forKey: "loginOK")
            UserDefaults.standard.set(self.displayName, forKey: "displayName")
            UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")
            let nextVC = self.storyboard?.instantiateViewController(identifier: "next") as! NextViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
        
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
        print("ログアウトしました")
    }
}

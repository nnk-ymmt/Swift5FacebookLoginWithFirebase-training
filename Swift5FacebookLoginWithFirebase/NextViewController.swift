//
//  NextViewController.swift
//  Swift5FacebookLoginWithFirebase
//
//  Created by 山本ののか on 2020/04/26.
//  Copyright © 2020 Nonoka Yamamoto. All rights reserved.
//

import UIKit
import SDWebImage

class NextViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "pictureURLString") != nil || (UserDefaults.standard.object(forKey: "displayName") != nil) {
            let imageString = UserDefaults.standard.object(forKey: "pictureURLString") as! String
            profileImageView.sd_setImage(with: URL(string: imageString), completed: nil)
            profileImageView.layer.cornerRadius = 20.0
            let displayName = UserDefaults.standard.object(forKey: "displayName") as! String
            userNameLabel.text = displayName
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

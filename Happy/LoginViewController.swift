//
//  LoginViewController.swift
//  Happy
//
//  Created by Jorge Alejos on 6/1/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func logInTapped(sender: AnyObject) {
        guard let user = usernameField.text else {
            return
        }
        guard let pass = passwordField.text else {
            return
        }
        print(user + pass)
        if (!user.isEmpty && !pass.isEmpty) {
            //TODO:validate log in
            self.performSegueWithIdentifier("home", sender: self)
        } else {
            SVProgressHUD.setMinimumDismissTimeInterval(1.0)
            SVProgressHUD.showErrorWithStatus("Username/Password not valid")
        }
    }
}

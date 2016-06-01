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
    
    let service = APIRequestService()
    
    
    @IBAction func logInTapped(sender: AnyObject) {
        guard let user = usernameField.text else {
            return
        }
        guard let pass = passwordField.text else {
            return
        }
        if (!user.isEmpty && !pass.isEmpty) {
            //TODO:validate log in
            SVProgressHUD.show()
            service.postRequest("v1/authenticate", params: ["email":user, "password":pass]){(data, error) in
                if let JSON = data{
                    SVProgressHUD.dismiss()
                    self.performSegueWithIdentifier("home", sender: self)
                }
                if error != nil{
                    self.invalidLogin()
                }
            }
        } else {
            self.invalidLogin()
        }
    }
    
    func invalidLogin() {
        SVProgressHUD.setMinimumDismissTimeInterval(3.0)
        SVProgressHUD.showErrorWithStatus("Username/Password not valid")
    }
}

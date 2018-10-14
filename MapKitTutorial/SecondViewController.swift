//
//  SecondViewController.swift
//  login-page
//
//  Created by Andy Ju on 10/14/18.
//  Copyright © 2018 Better Choice. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var passwordConfirm: UITextField!
    
    @IBOutlet var errorReport: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorReport.text=""
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signUp(_ sender: Any) {
        self.errorReport.isHidden = true

        if self.passwordField.text == self.passwordConfirm.text{
            if let email = self.emailField.text, let password = self.passwordField.text{
                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                                        if error != nil{
                                            self.errorReport.text="*Username taken or password too short"
                                            self.errorReport.isHidden=false
                                            
                                        }else{
                                            print("successfully created user")
                                            self.performSegue(withIdentifier: "signupSucc", sender: AnyObject?.self)

                                            //perform segue
                                        }
                                        guard let user = authResult?.user else { return }
                                    }
            }
        }else{
            self.errorReport.text="*Passwords do not match"
            self.errorReport.isHidden=false
        }
    }
    
}


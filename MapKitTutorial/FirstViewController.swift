//
//  FirstViewController.swift
//  login-page
//
//  Created by Andy Ju on 10/14/18.
//  Copyright © 2018 Better Choice. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var keyField: UITextField!
    @IBOutlet var loginFailure: UILabel!
    @IBOutlet var createAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createAccount.isHidden = true;
        self.loginFailure.isHidden = true;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        if let email = self.emailField.text, let password = self.keyField.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil{
                    print("success")
                    self.performSegue(withIdentifier: "loginSucc", sender: AnyObject?.self)
                    //perform segue
                }else{
                    
                    //report it to the user
                    self.loginFailure.isHidden = false
                    self.createAccount.isHidden = false

                }
            }
            print("correct!")
        }
    }
    

    
}


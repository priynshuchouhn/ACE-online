//
//  loginViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 04/07/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
       setUpElements()
    }

    func setUpElements(){
        
//        hidding the error label
        errorLabel.alpha = 0
        
//       styling the elements
        Utilities.styleTextField(emailLabel)
        Utilities.styleTextField(passwordLabel)
        Utilities.styleFilledButton(loginButton)
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
//        field validation
        
        
//        creating the cleaned text fields
        
        let email = emailLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        signing in the user
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if error != nil {
//                couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}


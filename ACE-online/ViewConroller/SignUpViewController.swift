//
//  signUpViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 04/07/22.
//
import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emaiLabel: UITextField!
    @IBOutlet weak var fullNameLabel: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        setUpElements()
       
    }
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        Utilities.styleTextField(emaiLabel)
        Utilities.styleTextField(fullNameLabel)
        Utilities.styleTextField(passwordLabel)
        Utilities.styleHollowButton(signUpButton)
    }

//    checks and validate the fields and data. if everything is correct then it returns nil otherwise it returns error message
    func validateFields() -> String? {
        
//        check all fields are filled in
        if fullNameLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emaiLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all Fields."
        }
        
//         check if password is secured
        let cleanedPassword = passwordLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
//            password isn't secure
            return "Please make sure your password is at least 8 characters long, contains special character and a number."
        }
        
        return nil
        
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
//        validate the fields
        let error = validateFields()
        
        if error != nil {
//            there is something wrong with fields
            showError(error!)
            
        }
        else{
            
//            creating the cleaned version of data
            
            let fullName = fullNameLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emaiLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //        create new user
            
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
//                check for errors
                if err != nil {
//                   error in creating user
                    self.showError("Error creating user!")
                }
                else{
//                    user successfully created, now store the full name in database
                  let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["FullName": fullName,
                                                              "Email" : email,
                                                              "Password" : password,
                                                              "uid" :result!.user.uid]) {(error)in
                        if error != nil {
//                           show error message
                            self.showError("User data couldn't saved")
                        }
                        
                    }
                }
            }
            
    //        transition to home screen
            
            transitionToHome()
        }
    }
}




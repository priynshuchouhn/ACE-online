//
//  ViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 04/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        setUpElements()
    }
    func setUpElements(){
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(signUpButton)
    }

}


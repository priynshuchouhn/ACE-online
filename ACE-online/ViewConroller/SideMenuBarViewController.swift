//
//  SideMenuBarViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 07/07/22.
//

import UIKit
import FirebaseAuth
protocol SideMenuBarViewControllerDelegate{
    func hideSideMenu()
}

class SideMenuBarViewController: UIViewController {
    
    var delegate: SideMenuBarViewControllerDelegate? 
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         sideMenuBarUI()
        

        
        
    }
    
    @IBAction func noticeBoardPressed(_ sender: UIButton) {
        print("hello world")
    }
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        print("logged out")
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.viewController) as? ViewController
            
        self.view.window?.rootViewController = ViewController
        self.view.window?.makeKeyAndVisible()
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
        
    }

    private func sideMenuBarUI(){
        
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
    }
    

}

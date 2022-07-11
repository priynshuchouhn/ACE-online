//
//  HomeViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 05/07/22.
//

import UIKit

class HomeViewController: UIViewController, SideMenuBarViewControllerDelegate {
    
    
    
    
    var sideMenuBarViewController: SideMenuBarViewController?
    
   
    @IBOutlet weak var leadingConstraintsForSideBar: NSLayoutConstraint!
    
    @IBOutlet weak var sideMenuBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sideMenuBar.isHidden = true

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sideMenuSegue") {
            if let controller = segue.destination as? SideMenuBarViewController
            {
                self.sideMenuBarViewController = controller
                self.sideMenuBarViewController?.delegate = self
                
              
            }
        }
       }

    func hideSideMenu() {
        self.hideSideMenu()
        }

    private func hideSideMenuBar(){
        self.sideMenuBar.isHidden = true
        self.leadingConstraintsForSideBar.constant = -280
        
    }
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        sideMenuBar.isHidden = false
        leadingConstraintsForSideBar.constant = 0
    }
    
    @IBAction func tappedOnBackView(_ sender: Any) {
        self.hideSideMenuBar()
    }
}

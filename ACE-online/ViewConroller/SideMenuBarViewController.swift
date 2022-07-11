//
//  SideMenuBarViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 07/07/22.
//

import UIKit
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
    
    private func sideMenuBarUI(){
        
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
    }
    
}
